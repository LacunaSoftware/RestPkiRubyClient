
module RestPki
    class PadesSignatureFinisher < SignatureFinisher

        def initialize(restpki_client)
            super(restpki_client)
            @signed_pdf_content = nil

            def finish
                if @token.nil?
                    raise 'The token was not set'
                end
                response = nil
                if @signature.nil?
                    response = @restpki_client.post("Api/PadesSignatures/#{@token}/Finalize", nil, 'pades_model')
                else
                    request = { signature: Base64.encode64(@signature) }
                    response = @restpki_client.post("Api/PadesSignatures/#{@token}/SignedBytes", request, 'pades_model')
                end

                @signed_pdf_content = Base64.decode64(response.signedPdf)
                @callback_argument = response.callbackArgument
                @certificate_info = response.certificate
                @done = true

                @signed_pdf_content
            end

            def signed_pdf_content
                unless @done
                    raise 'The "signed_pdf_content" field can only be accessed after calling the finish method'
                end
                @signed_pdf_content
            end

            def write_signed_pdf(pdf_path)
                unless @done
                    raise 'The method write_signed_pdf can only be called after calling the finish method'
                end

                file = File.open(pdf_path, 'wb')
                file.write(@signed_pdf_content)
                file.close
            end
        end
    end
end