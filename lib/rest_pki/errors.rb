module RestPki
  class RestPkiError < StandardError
  end

  class ConnectionError < RestPkiError
    attr_reader :error

    def initialize(error)
      @error = error
      super error.message
    end
  end

  class RequestError < RestPkiError
  end

  class ResponseError < RestPkiError
    attr_reader :parsed_error

    def initialize(parsed_error)
      @parsed_error = parsed_error
      super parsed_error[:message] || parsed_error["message"]
    end
  end

  class NotFound < ResponseError
    attr_reader :error
    def initialize(error)
      @error = error
      super error
    end
  end

  # class ValidationError < RestPkiError
  #   attr_reader :message, :code, :detail, :validationResults
  #
  #   def initialize(response)
  #     @response = response
  #     params = response.values_at('message', 'code', 'type', 'url')
  #     ParamError.new(*params)
  #     super @errors.map(&:message).join(', ')
  #   end
  # end

  # class ParamError < RestPkiError
  #   attr_reader :parameter_name, :type, :url
  #
  #   def initialize(message, parameter_name, type, url)
  #     @parameter_name, @type, @url = parameter_name, type, url
  #     super message
  #   end
  # end
end
