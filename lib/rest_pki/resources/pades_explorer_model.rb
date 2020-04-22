module RestPki
    class PadesExplorerModel
        attr_reader :signers

        def initialize(model)
            @signers = []
            for signer in model['signers'] do
                @signers.push(PadesSignerInfo.new(signer))
            end
        end
    end
end