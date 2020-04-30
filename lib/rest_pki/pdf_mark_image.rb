module RestPki
  class PdfMarkImage
    attr_accessor :resource

    def initialize(image_content=nil, mime_type=nil)
      @resource = ResourceContentOrReference.new
      unless image_content.nil?
        @resource.content = image_content
      end

      unless mime_type.nil?
        @resource.mime_type = mime_type
      end
    end

    def to_model
      if @resource.content.nil? && @resource.url.nil?
        raise 'The image content was not set, neither its URL'
      end
      {
          resource: @resource.to_model
      }
    end
  end
end
