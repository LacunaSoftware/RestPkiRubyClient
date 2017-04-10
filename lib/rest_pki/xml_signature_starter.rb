require 'base64'

module RestPki
    class XmlSignatureStarter < SignatureStarter

        def initialize(restpki_client)
            super(restpki_client)
            @xml_content_base64 = nil
            @signature_element_id = nil
            @xpath = nil
            @insertion_option = nil
            @namespace_manager = nil
        end

        #region set_xml_tosign

        def set_xml_tosign_from_path(xml_path)
            file = File.open(xml_path, 'rb')
            @xml_content_base64 = Base64.encode64(file.read)
            file.close

            @xml_content_base64
        end

        def set_xml_tosign_from_raw(content_raw)
            @xml_content_base64 = Base64.encode64(content_raw)
        end

        def set_xml_tosign_from_base64(content_base64)
            @xml_content_base64 = content_base64
        end

        def set_xml_content_tosign(content_raw)
            set_xml_tosign_from_raw(content_raw)
        end

        def set_xml_file_tosign(xml_path)
            set_xml_tosign_from_path(xml_path)
        end

        #endregion

        def set_signature_element_location(xpath, insertion_option, namespace_manager=nil)
            @xpath = xpath
            @insertion_option = insertion_option
            @namespace_manager = namespace_manager
        end

        protected
        def verify_common_parameters(is_with_webpki=false)
            unless is_with_webpki
                if @certificate.to_a.blank?
                    raise 'The certificate was not set'
                end
            end

            if @signature_policy_id.to_s.blank?
                raise 'The signature policy was not set'
            end
        end

        def get_request
            request = {
                signatureElementId: @signature_element_id,
                signaturePolicyId: @signature_policy_id,
                securityContextId: @security_context_id
            }
            unless @xml_content_base64.to_a.blank?
                request['xml'] = @xml_content_base64
            end
            unless @xpath.nil? or @insertion_option.nil?
                request['signatureElementLocation'] = {
                    xPath: @xpath,
                    insertionOption: @insertion_option
                }
                unless @namespace_manager.nil?
                    request['signatureElementLocation']['namespaces'] = @namespace_manager.namespaces
                end
            end
            request
        end
    end
end