
module RestPki
    class RestUnreachableError < RestBaseError

        def initialize(verb, url, error_message=nil)
            message = "REST action #{verb} #{url} unreachable"
            unless error_message.to_s.blank?
                message += ": #{error_message}"
            end
            super(message, verb, url)
        end
    end
end