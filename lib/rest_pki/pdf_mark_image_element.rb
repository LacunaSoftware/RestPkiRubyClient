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

    #region FluentApi

    def with_image(image)
      @image = image
      self
    end
  
    def with_image(image_content, mime_type)
      @image = PdfMarkImage.new(image_content, mime_type)
      self
    end
  
    #endregion
  
  end
end