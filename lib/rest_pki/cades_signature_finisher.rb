
module RestPki
    class CadesSignatureFinisher < SignatureFinisher

        def initialize(restpki_client)
            super(restpki_client)
            @cms = nil
        end

        def finish
            if @token.to_s.blank?
                raise 'The token was not set'
            end

            if @signature.to_s.blank?
                response = @restpki_client.post("Api/CadesSignatures/#{@token}/Finalize", nil, 'cades_model')
            else
                request = { signature: @signature }
                response = @restpki_client.post("Api/CadesSignatures/#{@token}/SignedBytes", request, 'cades_model')
            end

            @cms = Base64.decode64(response['cms'])
            @callback_argument = response['callbackArgument']
            @certificate_info = response['certificate']
            @done = true

            @cms
        end

        def cms
            unless @done
                raise 'The field "cms" can only be accessed after calling the finish method'
            end

            @cms
        end

        def write_cms_to_path(path)
            unless @done
                raise 'The method write_cms_to_path can only be called after calling the finish method'
            end

            file = File.open(path, 'wb')
            file.write(@cms)
            file.close
        end
    end
end
