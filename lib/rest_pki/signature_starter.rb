
module RestPki
    class SignatureStarter
        attr_accessor :signature_policy_id, :security_context_id, :callback_argument

        def initialize(restpki_client)
            @restpki_client = restpki_client
            @signature_policy_id = nil
            @security_context_id = nil
            @callback_argument = nil
            @done = false
            @signer_certificate = nil
        end

        def signer_certificate
            unless @done
                raise 'The certificate field can only be accessed after calling one of the start methods'
            end
            @signer_certificate
        end

        def start_with_webpki
            raise "#{self.class.name}#start_with_webpki is an abstract method."
        end
    end
end