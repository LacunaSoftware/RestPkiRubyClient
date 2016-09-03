require 'uri'
require 'rest_client'
require 'multi_json'
require 'base64'

module RestPki
  class PadesSignature
    attr_accessor :pdf_content_base64, :security_context_id, :signature_policy_id, :callback_argument, :visual_representation


    def initialize(pdf_content_base64, security_context_id, signature_policy_id, callback_argument = nil, visual_representation = nil)
      @pdf_content_base64 = Base64.encode64(read_file(pdf_content_base64))
      @security_context_id = security_context_id
      @signature_policy_id = signature_policy_id
      @callback_argument = callback_argument
      @visual_representation = visual_representation
    end

    def start_with_web_pki
      RestPki::Request.post('Api/PadesSignatures', params: { securityContextId: self.security_context_id,
                                                             pdfToSign: self.pdf_content_base64,
                                                             signaturePolicyId: self.signature_policy_id,
                                                             callbackArgument: self.callback_argument,
                                                             visual_representation: self.visual_representation
      }).call('pades_model')
    end

    def self.finisher(token)
      RestPki::Request.post('Api/PadesSignatures/' + token + '/Finalize').call('pades_model')
    end

    def read_file(file_name)
      file = File.open(file_name, "rb")
      data = file.read
      file.close
      return data
    end

  end
end