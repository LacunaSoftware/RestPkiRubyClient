require 'base64'

module RestPki
    class SignatureExplorer
        attr_accessor :default_signature_policy_id, :security_context_id, :acceptable_explicit_policies, :validate
        
        def initialize(restpki_client)
            @restpki_client = restpki_client
            @signature_file_content = nil
            @default_signature_policy_id = nil
            @security_context_id = nil
            @validate = true
            @acceptable_explicit_policies = nil
        end

        def set_signature_file_from_path(path)
            file = File.open(path, 'rb')
            @signature_file_content = file.read
            file.close
        end
      
        def set_signature_file_from_content_raw(content_raw)
            @signature_file_content = content_raw
        end
        
        def set_signature_file_from_content_base64(content_base64)
            @signature_file_content =  Base64.decode64(content_base64)
        end

        protected
        def get_request(mime_type)
            request = {
                validate: @validate,
                securityContextId: @security_context_id,
                acceptableExplicitPolicies: @acceptable_explicit_policies,
                defaultSignaturePolicyId: @default_signature_policy_id
            }

            unless @signature_file_content.to_s.empty?
                request['file'] = {
                    content: Base64.encode64(@signature_file_content),
                    mimeType: mime_type
                }
            end
            request
        end
    end
end