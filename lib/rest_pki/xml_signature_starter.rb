require 'base64'

module RestPki
  class XmlSignatureStarter
    attr_accessor :xml_content, :xpath, :insertion_option, :namespace_option, :namespace_manager,
                  :signature_element_id, :security_context_id, :signature_policy_id, :callback_argument

    def initialize
    end

    def set_xml_path(local_path)
      file = File.open(local_path, 'rb')
      @xml_content = file.read
      file.close
    end

    def set_signature_element_location(xpath, insertion_option, namespace_manager)
      @xpath = xpath
      @insertion_option = insertion_option
      @namespace_manager = namespace_manager
    end

    def get_common_request_data

      if @signature_policy_id.nil?
        raise 'The signature policy was not set'
      end

      data = {
          'signatureElementId': @signature_element_id,
          'signaturePolicyId': @signature_policy_id,
          'securityContextId': @security_context_id,
          'callbackArgument': @callback_argument
      }

      if @xml_content
        data['xml'] = Base64.encode64(xml_content)
      end
      if @xpath
        data['signatureElementLocation'] = {
            'xpath': @xpath,
            'insertionOption': @insertion_option ? @insertion_option : nil,
            'namespaces': @namespace_manager ? @namespace_manager.namespaces : nil
        }
      end

      data
    end

    def start_with_webpki
      raise "#{self.class.name}#start_with_webpki is an abstract method."
    end

  end
end