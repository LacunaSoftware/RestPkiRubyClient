module RestPki
    class FullXmlSignatureStarter < XmlSignatureStarter

        def initialize(restpki_client)
            super(restpki_client)
        end

        def start_with_webpki
            verify_common_parameters(true)
            if @xml_content_base64.to_s.blank?
                raise 'The XML to sign was not set'
            end

            request = get_request

            response = @restpki_client.post('Api/XmlSignatures/FullXmlSignature', request, 'xml_model')

            unless response['certificate'].nil?
                @certificate = response['certificate']
            end
            @done = true

            response['token']
        end

        def start
            verify_common_parameters(true)
            if @xml_content_base64.to_s.blank?
                raise 'The XML to sign was not set'
            end

            request = get_request
            request['ignoreRevocationStatusUnknown'] = @ignore_revocation_status_unknown

            response = @restpki_client.post('Api/XmlSignatures/FullXmlSignature', request, 'xml_model')

            unless response['certificate'].nil?
                @certificate = response['certificate']
            end
            @done = true

            {
                :token => response['token'],
                :to_sign_data => response['toSignData'],
                :to_sign_hash => response['toSignHash'],
                :digest_algorithm_oid => response['digestAlgorithmOid'],
                :signature_algorithm => get_signature_algorithm(response['digestAlgorithmOid'])
            }
        end

    end
end