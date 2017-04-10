
module RestPki
    class SignatureStarter
        attr_accessor :certificate, :signature_policy_id, :security_context_id, :callback_argument

        def initialize(restpki_client)
            @restpki_client = restpki_client
            @certificate = nil
            @signature_policy_id = nil
            @security_context_id = nil
            @callback_argument = nil
            @done = false
            @certificate_info = nil
        end

        def certificate
            unless @done
                raise 'The field "certificate" can only be accessed after calling one of the start methods'
            end
            @certificate
        end

        def start_with_webpki
            raise "#{self.class.name}#start_with_webpki is an abstract method."
        end
    end
end