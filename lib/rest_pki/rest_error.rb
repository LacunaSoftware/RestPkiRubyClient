
module RestPki
    class RestError < RestBaseError
        attr_reader :status_code, :error_message

        def initialize(verb, url, status_code, error_message=nil)
            message = "REST action #{verb} #{url} returned HTTP error #{status_code}"
            unless error_message.to_s.empty?
                message += ": #{error_message}"
            end
            super(message, verb, url)
            @status_code = status_code
            @error_message = error_message
        end
    end
end