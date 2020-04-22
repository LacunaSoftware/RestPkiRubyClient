require 'base64'

module RestPki
    class DigestAlgorithmAndValue
        attr_reader :algorithm, :value
        def initialize(model)
            unless model['algorithm']
                raise 'The algorithm was not set'
            end
            unless model['value']
                raise 'The value was not set'
            end
            @algorithm = DigestAlgorithm.get_instance_by_api_model(model['algorithm'])
            @value = Base64.decode64(model['value'])
        end

        def hex_value
            return @value.each_byte.map { |b| b.to_s(16) }.join
        end
      
        def to_model()
            {
               algorithm: @algorithm.api_model,
               value: @value
            }
        end
    end
end
