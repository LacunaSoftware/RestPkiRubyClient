module RestPki
    class PadesVisualRectangle
        attr_accessor :left, :right, :top, :bottom, :width, :height
        
        def initialize()
            @left = nil
            @top = nil
            @right = nil
            @bottom = nil
            @width = nil
            @height = nil
        end

        def to_model()
            return {
                left: @left,
                top: @top,
                right: @right,
                bottom: @bottom,
                width: @width,
                height: @height
            }
        end
    end
end