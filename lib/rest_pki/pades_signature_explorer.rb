module RestPki
    PDF_MIME_TYPE = 'application/pdf'
    class PadesSignatureExplorer < SignatureExplorer
        def initialize(restpki_client)
            super(restpki_client)
        end

        def open()
            if @signature_file_content.to_s.empty?
                raise 'The signature file to be opened not set'
            end

            request = get_request(PDF_MIME_TYPE)
            @restpki_client.post('Api/PadesSignatures/Open', request, 'pades_explorer_model')
        end
    end
end