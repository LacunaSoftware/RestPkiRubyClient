require 'uri'
require 'rest_client'
require 'multi_json'

module RestPki
    class Authentication
        attr_reader :done

        def initialize(restpki_client)
            @restpki_client = restpki_client
            @done = false
        end

        def start_with_webpki(security_context_id)
            request = {securityContextId: security_context_id}
            response = @restpki_client.post('Api/Authentications', request, 'authentication_model')
            response.token
        end

        def complete_with_webpki(token)
            response = @restpki_client.post("Api/Authentications/#{token}/Finalize", nil, 'authentication_model')
            unless response.certificate.nil?
                @certificate = response.certificate
            end
            @done = true

            ValidationResults.new(response.validationResults)
        end

        def certificate
            unless @done
                raise 'The field can only be accessed after calling the complete_with_webpki method'
            end
            @certificate
        end
    end
end