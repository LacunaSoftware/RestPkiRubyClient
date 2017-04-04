
module RestPki
    class ValidationItem
        attr_reader :type, :message, :detail

        def initialize(model)
            @type = model.type
            @message = model.message
            @detail = model.detail
            @inner_validation_results = nil
            unless model.innerValidationResults.nil?
                @inner_validation_results = new ValidationResults(model.innerValidationResults)
            end
        end

        def __to_string
            to_string(0)
        end

        def to_string(indentation_level)
            text = ''
            text += @message
            unless @detail.nil?
                text += " (#{@detail})"
            end
            unless @inner_validation_results.nil?
                text += '\n'
                text += @inner_validation_results.to_string(indentation_level + 1)
            end
            text
        end
    end
end