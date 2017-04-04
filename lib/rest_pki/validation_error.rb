
module RestPki
    class ValidationError < RestBaseError
        attr_reader :validation_results

        def initialize(verb, url, validation_results)
            super(validation_results.__to_string, verb, url)
            @validation_results = validation_results
        end
    end
end