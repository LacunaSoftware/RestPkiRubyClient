require 'base64'

module RestPki
    class SignatureAlgorithmAndValue
        attr_reader :algorithm, :value
        def initialize(model)
            @algorithm = SignatureAlgorithm.get_instance_by_api_model(model['algorithmIdentifier'])
            @value = Base64.decode64(model['value'])
        end
    end
end