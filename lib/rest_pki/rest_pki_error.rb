
module RestPki
    class RestPkiError < RestBaseError
        attr_reader :error_code, :detail

        def initialize(verb, url, error_code, detail)
            message = "REST PKI action #{verb} #{url} error: #{error_code}"
            unless detail.to_s.empty?
                message += " (#{detail})"
            end
            super(message, verb, url)
            @error_code = error_code
            @detail = detail
        end
    end
end