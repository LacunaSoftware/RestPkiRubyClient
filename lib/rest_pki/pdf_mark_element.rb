module RestPki
  class PdfMarkElement
    attr_accessor :element_type, :relative_container, :rotation, :opacity

    def initialize(element_type, relative_container = nil)
      @element_type = element_type
      @relative_container = relative_container
      @rotation = 0
      @opacity = 100
    end

    def to_model
      {
          elementType: @element_type,
          relative_container: @relative_container,
          rotation: @rotation,
          opacity: @opacity,
      }
    end
  end
end