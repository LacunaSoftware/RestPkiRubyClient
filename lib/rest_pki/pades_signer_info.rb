module RestPki
    class PadesSignerInfo < CadesSignerInfo
        attr_reader :is_document_timestamp, :signature_fie_id_name

        def initialize(model)
            super(model)
            @is_document_timestamp = model['isDocumentTimestamp']
            @signature_fie_id_name = model['signatureFieldName']
        end
    end
end