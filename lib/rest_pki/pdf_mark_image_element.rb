module RestPki
  class PdfMarkImageElement < PdfMarkElement
    attr_accessor :image

    def initialize(relative_container = nil, image = nil)
      super(PdfMarkElementType::IMAGE, relative_container)
      @image = image
    end

    def to_model
      model = super
      unless @image.nil?
        model['image'] = @image.to_model
      end
      model
    end
  end
end