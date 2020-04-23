module RestPki
  class PdfMarkerModel
    attr_reader :file

    def initialize(model, _)
      @file = model['model']
    end
  end
end