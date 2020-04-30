module RestPki
    class SignaturePolicyIdentifier
        attr_reader :digest, :oid, :uri
        def initialize(model)
            @digest = DigestAlgorithmAndValue.new(model['digest'])
            @oid = model['oid']
            @uri = model['uri']
        end
    end
end