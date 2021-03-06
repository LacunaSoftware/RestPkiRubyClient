module RestPki
    class XmlElementSignatureStarter < XmlSignatureStarter
        attr_accessor :element_tosign_id, :id_resolution_table

        def initialize(restpki_client)
            super(restpki_client)
            @element_tosign_id = nil
            @id_resolution_table = nil
        end

        def start_with_webpki
            verify_common_parameters(true)
            if @xml_content_base64.to_s.blank?
                raise 'The XML was not set'
            end
            if @element_tosign_id.to_s.blank?
                raise 'The XML element id to sign was not set'
            end

            request = get_request
            request['elementToSignId'] = @element_tosign_id
            unless @id_resolution_table.nil?
                request['idResolutionTable'] = @id_resolution_table.to_model
            end

            response = @restpki_client.post('Api/XmlSignatures/XmlElementSignature', request, 'xml_model')

            unless response['certificate'].nil?
                @certificate = response['certificate']
            end
            @done = true

            response['token']
        end

        def start
            verify_common_parameters(true)
            if @xml_content_base64.to_s.blank?
                raise 'The XML was not set'
            end
            if @element_tosign_id.to_s.blank?
                raise 'The XML element id to sign was not set'
            end

            request = get_request
            request['elementToSignId'] = @element_tosign_id
            unless @id_resolution_table.nil?
                request['idResolutionTable'] = @id_resolution_table.to_model
            end

            response = @restpki_client.post('Api/XmlSignatures/XmlElementSignature', request, 'xml_model')

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