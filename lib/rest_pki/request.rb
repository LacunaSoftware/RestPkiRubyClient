require 'uri'
require 'rest_client'
require 'multi_json'

module RestPki
  class Request
    attr_accessor :path, :method, :parameters, :headers

    DEFAULT_HEADERS = {
      'Content-Type' => 'application/json; charset=utf8',
      'Accept'       => 'application/json'
    }

    def initialize(path, method, options={})
      raise RestPki::RequestError, 'You need to configure a API key before performing requests.' unless RestPki.api_key and RestPki.api_key != 'PLACE_YOUR_API_KEY_HERE'

      @path       = path
      @method     = method
      @parameters = options[:params]  || Hash.new
      @headers    = options[:headers] || Hash.new
      
      headers['Authorization'] = "Bearer #{RestPki.api_key}"

    end

    def run
      response = RestClient::Request.execute request_params
      MultiJson.decode response.body
    rescue RestClient::Exception => error
      begin
        parsed_error = MultiJson.decode error.http_body

        if parsed_error['message']
          raise RestPki::ResponseError.new(parsed_error)
        else
          raise RestPki::NotFound.new(error)
        end
      rescue MultiJson::ParseError
        raise RestPki::ResponseError.new(error)
      end
    rescue MultiJson::ParseError
      raise RestPki::ResponseError.new(error)
    rescue SocketError
      raise RestPki::ConnectionError.new $!
    rescue RestClient::ServerBrokeConnection
      raise RestPki::ConnectionError.new $!
    end

    def call(object)
      RestPkiObject.convert(run, object)
    end

    def self.get(url, options={})
      self.new url, 'GET', options
    end

    def self.post(url, options={})
      self.new url, 'POST', options
    end

    def self.put(url, options={})
      self.new url, 'PUT', options
    end

    def self.delete(url, options={})
      self.new url, 'DELETE', options
    end

    protected
    def request_params
      {
        method:       method,
        url:          full_api_url,
        payload:      MultiJson.encode(parameters),
        open_timeout: RestPki.open_timeout,
        timeout:      RestPki.timeout,
        headers:      DEFAULT_HEADERS.merge(headers)
      }
    end

    def full_api_url
      RestPki.api_endpoint + path
    end
  end
end
