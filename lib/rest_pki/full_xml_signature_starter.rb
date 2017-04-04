module RestPki
    class FullXmlSignatureStarter < XmlSignatureStarter

        def initialize(restpki_client)
            super(restpki_client)
        end

        def start_with_webpki
            verify_common_parameters(true)
            if @xml_content_base64.nil?
                raise 'The XML to sign was not set'
            end

            request = get_request
            response = @restpki_client.post('Api/XmlSignatures/FullXmlSignature', request, 'xml_model')

            unless response.certificate.nil?
            @signer_certificate = response.certificate
        end
        @done = true

            response.token
        end

    end
end