require 'base64'

module RestPki
    class SignatureStarter
        attr_accessor :signature_policy_id, :security_context_id, :callback_argument, :ignore_revocation_status_unknown

        def initialize(restpki_client)
            @restpki_client = restpki_client
            @signer_certificate_base64 = nil
            @signature_policy_id = nil
            @security_context_id = nil
            @callback_argument = nil
            @done = false
            @certificate = nil
            @ignore_revocation_status_unknown = false
        end

        def certificate
            unless @done
                raise 'The field "certificate_info" can only be accessed after calling one of the start methods'
            end
            @certificate
        end

        def signer_certificate_base64=(content_base64)
            @signer_certificate_base64 = content_base64
        end

        def signer_certificate=(content_raw)
            @signer_certificate_base64 = Base64.encode64(content_raw)
        end

        def start_with_webpki
            raise "#{self.class.name}#start_with_webpki is an abstract method."
        end

        def start
            raise "#{self.class.name}#start is an abstract method."
        end

        protected
        def get_signature_algorithm(oid)
            case oid
                when '1.2.840.113549.2.5'
                    return OpenSSL::Digest::MD5.new
                when '1.3.14.3.2.26'
                    return OpenSSL::Digest::SHA1.new
                when '2.16.840.1.101.3.4.2.1'
                    return OpenSSL::Digest::SHA256.new
                when '2.16.840.1.101.3.4.2.2'
                    return OpenSSL::Digest::SHA384.new
                when '2.16.840.1.101.3.4.2.3'
                    return OpenSSL::Digest::SHA512.new
                else
                    return nil
            end
        end
    end
end