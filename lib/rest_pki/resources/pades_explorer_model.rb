module RestPki
    class PadesExplorerModel
        attr_reader :signers

        def initialize(model, _)
            @signers = []
            model['signers'].each { |signer|
                @signers.push(PadesSignerInfo.new(signer))
            }
        end
    end
end