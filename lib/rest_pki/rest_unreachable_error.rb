
module RestPki
    class RestUnreachableError < RestBaseError

        def initialize(verb, url, error_message)
            super("REST action #{verb} #{url} unreachable: #{error_message}", verb, url)
        end
    end
end