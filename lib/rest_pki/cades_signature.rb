module RestPki
    class CadesSignature
        attr_reader :encapsulated_content_type, :has_encapsulated_content, :signers
        def initialize(model)
            @encapsulated_content_type = model['encapsulatedContentType'];
            @has_encapsulated_content = model['hasEncapsulatedContent'];
            @signers = [];
            if (model['signers'])
                for signer in model['signers']
                    @signers.push(CadesSignerInfo.new(signer));
                end
            end
        end
    end

    class CadesTimestamp < CadesSignature
        attr_reader :gen_time, :serial_number, :message_imprint
        def initialize(model)
            super(model)
            @gen_time = model['genTime']
            @serial_number = model['serialNumber']
            @message_imprint = DigestAlgorithmAndValue.new(model['messageImprint'])
        end
    end

    class CadesSignerInfo
        attr_reader :message_digest, :signature, :certificate, :signing_time, :certified_date_reference, :signature_policy, :timestamps, :validation_results

        def initialize(model)
            @message_digest = DigestAlgorithmAndValue.new(model['messageDigest'])
            @signature = SignatureAlgorithmAndValue.new(model['signature'])
            @certificate = PKCertificate.new(model['certificate'])
            @signing_time = model['signingTime']
            @certified_date_reference = model['certifiedDateReference']

            if (model['signaturePolicy'])
                @signature_policy = SignaturePolicyIdentifier.new(model['signaturePolicy'])
            end

            @timestamps = []
            if (model['timestamps'])
                for timestamp in model['timestamps']
                    @timestamps.push(CadesTimestamp.new(timestamp))
                end
            end

            if (model['validationResults'])
                @validation_results = ValidationResults.new(model['validationResults'])
            end
        end
    end
end