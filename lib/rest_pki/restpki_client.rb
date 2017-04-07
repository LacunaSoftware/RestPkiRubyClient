require 'uri'
require 'rest_client'
require 'multi_json'

module RestPki
    class RestPkiClient

        def initialize(endpoint_url, access_token)
            @endpoint_url = endpoint_url
            @access_token = access_token
        end

        def get(url, object_model)
            verb = 'GET'
            params = get_rest_params(verb, url)
            response = nil

            begin
                response = RestClient::Request.execute params
            rescue RestClient::Exception => ex
                raise RestUnreachableError.new(verb, url, ex.message)
            end
            check_response(verb, url, response)

            RestPkiObject.convert(MultiJson.decode(response.body), object_model)
        end

        def post(url, data, object_model)
            verb = 'POST'
            params = get_rest_params(verb, url, data)
            response = nil

            begin
                response = RestClient::Request.execute params
            rescue RestClient::Exception => ex
                raise RestUnreachableError.new(verb, url, ex.message)
            end
            check_response(verb, url, response)

            RestPkiObject.convert(MultiJson.decode(response.body), object_model)
        end

        def get_authentication
            Authentication.new(self)
        end

        private
        def get_rest_params(method, url, params=nil)
            {
                method: method,
                url: @endpoint_url + url,
                payload: params ? MultiJson.encode(params) : nil,
                open_timeout: 30,
                timeout: 90,
                headers: {
                    'Content-Type': 'application/json; charset=utf8',
                    Accept: 'application/json',
                    Authorization: "Bearer #{@access_token}"
                }
            }
        end

        def check_response(verb, url, response)
            status_code = response.code
            if status_code < 200 or status_code > 299
                ex = null
                begin
                    response = MultiJson.decode response.body
                    if status_code == 422 and response.code.to_a.empty?
                        if response.code == 'ValidationError'
                            vr = ValidationResults.new(response.validationResults)
                            ex = ValidationError.new(verb, url, vr)
                        else
                            ex = RestPkiError.new(verb, url, response.code, response.detail)
                        end
                    else
                        ex = RestError.new(verb, url, status_code, response.message)
                    end
                rescue => e
                    ex = RestError.new(verb, url, status_code)
                end
                raise ex
            end
        end
    end
end