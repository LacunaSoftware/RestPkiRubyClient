require 'base64'

module RestPki
    class PadesSignatureStarter < SignatureStarter
        attr_accessor :visual_representation

        def initialize(restpki_client)
            super(restpki_client)
            @pdf_content_base64 = nil
            @visual_representation = nil
        end

        #region set_pdf_tosign

        def set_pdf_tosign_from_path(pdf_path)
            file = File.open(pdf_path, 'rb')
            @pdf_content_base64 = Base64.encode64(file.read)
            file.close
        end

        def set_pdf_tosign_from_raw(content_raw)
            @pdf_content_base64 = Base64.encode64(content_raw)
        end

        def set_pdf_tosign_from_base64(content_base64)
            @pdf_content_base64 = content_base64
        end

        def set_pdf_content_tosign(content_raw)
            set_pdf_tosign_from_raw(content_raw)
        end

        def set_pdf_file_tosign(pdf_path)
            set_pdf_tosign_from_path(pdf_path)
        end

        #endregion

        def start_with_webpki
            if @pdf_content_base64.nil?
                raise 'The PDF to sign was not set'
            end
            if @signature_policy_id.nil?
                raise 'The signature policy was not set'
            end

            request = {
                securityContextId: @security_context_id,
                pdfToSign: @pdf_content_base64,
                signaturePolicyId: @signature_policy_id,
                callbackArgument: @callback_argument,
                visualRepresentation: @visual_representation
            }
            unless @signer_certificate.nil?
                request['certificate'] = Base64.encode64(@signer_certificate)
            end

            response = @restpki_client.post('Api/PadesSignatures', data: request, object_model: 'pades_model')

            unless response.certificate.nil?
                @signer_certificate = response.certificate
            end
            @done = true

            response.token
        end
    end
end