
module RestPki
    class RestBaseError < StandardError
        attr_reader :verb, :url

        def initialize(message, verb, url)
            super(message)
            @verb = verb
            @url = url
        end
    end
end