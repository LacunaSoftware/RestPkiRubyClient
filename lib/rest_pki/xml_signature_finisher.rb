require 'base64'

module RestPki
    class XmlSignatureFinisher < SignatureFinisher
        attr_accessor :signed_xml_content

        def initialize(restpki_client)
            super(restpki_client)
            @signed_xml_content = nil
        end

        def finish
            if @token.nil?
                raise 'The Token was not set'
            end
            response = nil
            if @signature.nil?
                response = @restpki_client.post("Api/XmlSignatures/#{@token}/Finalize", nil, 'xml_model')
            else
                request = { signature: Base64.encode64(@signature) }
                response = @restpki_client.post("Api/XmlSignatures/#{@token}/SignedBytes", request, 'xml_model')
            end

            @signed_xml_content = Base64.decode64(response.signedXml)
            @callback_argument = response.callbackArgument
            @certificate_info = response.certificate
            @done = true

            @signed_xml_content
        end

        def write_signed_xml(local_xml_path)
            unless @done
                raise 'The method write_signed_xml() can only be called after calling the finish method'
            end

            file = File.open(local_xml_path, 'wb')
            file.write(@signed_xml_content)
            file.close
        end

    end
end
