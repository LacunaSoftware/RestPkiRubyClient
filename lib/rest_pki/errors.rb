module RestPki
  class RestPkiError < StandardError
  end

  class ConnectionError < RestPkiError
    attr_reader :error

    def initialize(error)
      @error = error
    end
  end

  class RequestError < RestPkiError
    attr_reader :error

    def initialize(error)
      @error = error
    end
  end

  class ResponseError < RestPkiError
    attr_reader :error

    def initialize(error)
      @error = error
    end
  end

  class NotFound < ResponseError
    attr_reader :error
    def initialize(error)
      @error = error
    end
  end
end
