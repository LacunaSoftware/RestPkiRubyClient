require 'uri'
require 'rest_client'
require 'multi_json'

module RestPki
    class Authentication
        attr_accessor :ignore_revocation_status_unknown

        def initialize(restpki_client)
            @restpki_client = restpki_client
            @certificate_info = nil
            @done = false
            @ignore_revocation_status_unknown = false
        end

        def start_with_webpki(security_context_id)
            request = {
                securityContextId: security_context_id,
                ignoreRevocationStatusUnknown: @ignore_revocation_status_unknown
            }
            response = @restpki_client.post('Api/Authentications', request, 'authentication_model')
            response['token']
        end

        def complete_with_webpki(token)
            response = @restpki_client.post("Api/Authentications/#{token}/Finalize", nil, 'authentication_model')
            
            unless response['certificate'].nil?
                @certificate_info = response['certificate']
            end
            @done = true

            ValidationResults.new(response['validationResults'])
        end

        def certificate_info
            unless @done
                raise 'The field "certificate_info" can only be accessed after calling the complete_with_webpki method'
            end
            @certificate_info
        end
    end
end