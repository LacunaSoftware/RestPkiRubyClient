require 'base64'

module RestPki
  class XmlSignatureFinisher
    attr_accessor :token, :done, :signed_xml_content, :certificate, :callback_argument

    def initialize
    end

    def finish
      if @token.nil?
        raise 'The Token was not set'
      end

      response = RestPki::Request.post("Api/XmlSignatures/#{@token}/Finalize").call('xml_model')
      @signed_xml_content = Base64.decode64(response.signedXml)
      @certificate = response.certificate
      @callback_argument = response.callbackArgument
      @done = true
      response
    end

    def write_signed_xml(local_xml_path)
      if !@done
        raise 'The method write_signed_xml() can only be called after calling the finish() method'
      end

      file = File.open(local_xml_path, 'wb')
      file.write(@signed_xml_content)
      file.close
    end

  end
end
