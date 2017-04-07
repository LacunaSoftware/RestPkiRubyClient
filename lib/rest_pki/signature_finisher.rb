
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
        end

        def finish
            raise "#{self.class.name}#finish is an abstract method."
        end

        def get_callback_argument
            unless @done
                raise 'The "callback_argument" field can only be accessed after calling the finish method'
            end
            @callback_argument
        end

        def certificate_info
            unless @done
                raise 'The "certificate_info" field can only be accessed after calling the finish method'
            end
            @certificate_info
        end
    end
end