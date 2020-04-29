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
          relativeContainer: @relative_container,
          rotation: @rotation,
          opacity: @opacity,
      }
    end

    #region FluentApi
    def on_container(relative_container)
      @relative_container = relative_container
      self
    end
  
    def with_rotation(rotation)
      @rotation = rotation
      self
    end
  
    def rotate90_clockwise
      @rotation = 270
      self
    end
  
    def rotate90_counter_clockwise
      @rotation = 90
      self
    end
  
    def rotate180
      @rotation = 180
      self
    end
  
    def with_opacity(opacity)
      @opacity = opacity
      self
    end
  
    #endregion
  end
end