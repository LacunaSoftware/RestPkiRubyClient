
module RestPki
    class SignatureFinisher
        attr_accessor :token, :signature

        def initialize(restpki_client)
            @restpki_client = restpki_client
            @token = nil
            @signature = nil
            @callback_argument = nil
            @certificate_info = nil
            @done = false

            def finish
                raise "#{self.class.name}#finish is an abstract method."
            end

            def get_callback_argument
                unless @done
                    raise 'The callback_argument field can only be accessed after calling the finish method'
                end
                @callback_argument
            end

            def get_certificate_info
                unless @done
                    raise 'The certificate field can only be accessed after calling the finish method'
                end
            end
        end
    end
end