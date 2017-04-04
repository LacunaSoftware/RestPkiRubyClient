
module RestPki
    class ValidationResults

        def initialize(model)
            @errors = convert_items(model.errors)
            @warnings = convert_items(model.warnings)
            @passed_checks = convert_items(model.passedChecks)
        end

        def is_valid
            @errors.to_a.empty?
        end

        def get_checks_performed
            @errors.to_a.length + @warnings.to_a.length + @passed_checks.to_a.length
        end

        def has_errors
            !is_valid
        end

        def has_warnings
            @warnings.to_a.any?
        end

        def has_passed_checks
            @passed_checks.to_a.any?
        end

        def __to_string
            to_string(0)
        end

        def to_string(indentation_level)
            tab = ''
            (1..indentation_level).each do; tab += '\t'; end
            text = ''
            text += get_summary(indentation_level)
            if has_errors
                text += "\n#{tab}Errors:\n"
                text += join_items(@errors, indentation_level)
            end
            if has_warnings
                text += "\n#{tab}Warnings:\n"
                text += join_items(@warnings, indentation_level)
            end
            if has_passed_checks
                text += "\n#{tab}Passed checks:\n"
                text += join_items(@passed_checks, indentation_level)
            end
            text
        end

        def get_summary(indentation_level)
            tab = ''
            (1..indentation_level).each do; tab += '\t'; end
            text = "#{tab}Validation results: "
            if get_checks_performed == 0
                text += 'no checks performed'
            else
                text += "#{get_checks_performed} checks performed"
                if has_errors
                    text += ", #{@errors.to_a.length} errors"
                end
                if has_warnings
                    text += ", #{@warnings.to_a.length} warnings"
                end
                if has_passed_checks
                    if !has_errors && !has_warnings
                        text += ', all passed'
                    else
                        text += ", #{@passed_checks.to_a.length} passed"
                    end
                end
            end
            text
        end

        private
        def convert_items(items)
            converted = []
            items.each do |item|
                converted.push(RestPki::ValidationItem.new(item))
            end
            converted
        end

        def join_items(items, indentation_level)
            text = ''
            is_first = true
            tab = ''
            (1..indentation_level).each do; tab += '\t'; end

            items.each do |item|
                if is_first
                    is_first = false
                else
                    text += '\n'
                end
                text += "#{tab}- "
                text += item.to_string(indentation_level)
            end
            text
        end
    end
end