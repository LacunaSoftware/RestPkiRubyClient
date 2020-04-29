module RestPki
    class PdfContainerDefinition
        attr_reader :container

        def initialize
            @container = PadesVisualRectangle.new
        end

        def width(value)
            @container.width = value
            FixedWidth.new(@container)
        end
    
        def var_width
            VarWidth.new(@container)
        end
    
        def full_width
            @container.left = 0.0
            @container.right = 0.0
            WidthDefined.new(@container)
        end
    
        def height(value)
            @container.height = value
            FixedHeight.new(@container)
        end
    
        def var_height
            VarHeight.new(@container)
        end
    
        def full_height
            @container.top = 0.0
            @container.bottom = 0.0
            HeightDefined.new(@container)
        end
    
        def var_width_and_height
            VarWidthAndHeight.new(@container)
        end
    
        def full
            @container.top = 0.0
            @container.right = 0.0
            @container.bottom = 0.0
            @container.left = 0.0
            @container
        end
    end

    class FixedWidth

        def initialize(container)
            @container = container
        end
    
        def anchor_left(margin=0.0)
            @container.left = margin
            WidthDefined.new(@container)
        end
    
        def anchor_right(margin=0.0)
            @container.right = margin
            WidthDefined.new(@container)
        end
    
        def center
            WidthDefined.new(@container)
        end
    end
    
    class VarWidth
    
        def initialize(container)
            @container = container
        end
    
        def margins(left_margin, right_margin=nil)
            if right_margin.nil?
                right_margin = left_margin
            end
            @container.left = left_margin
            @container.right = right_margin
            WidthDefined.new(@container)
        end
    end
    
    class FixedHeight
    
        def initialize(container)
            @container = container
        end
    
        def anchor_top(margin=0.0)
            @container.top = margin
            HeightDefined.new(@container)
        end
    
        def anchor_bottom(margin=0.0)
            @container.bottom = margin
            HeightDefined.new(@container)
        end
    
        def center
            HeightDefined.new(@container)
        end
    end
    
    class VarHeight
    
        def initialize(container)
            @container = container
        end
    
        def margins(top_margin, bottom_margin=nil)
            if bottom_margin.nil?
                bottom_margin = top_margin
            end
            @container.top = top_margin
            @container.bottom = bottom_margin
            HeightDefined.new(@container)
        end
    end
    
    class WidthDefined
        def initialize(container)
            @container = container
        end
    
        def height(value)
            @container.height = value
            WidthDefinedFixedHeight.new(@container)
        end
    
        def var_height
            WidthDefinedVarHeight.new(@container)
        end
    
        def full_height
            @container.top = 0.0
            @container.bottom = 0.0
            @container
        end
    end
    
    class HeightDefined
        def initialize(container)
            @container = container
        end
    
        def width(value)
            @container.width = value
            HeightDefinedFixedWidth.new(@container)
        end
    
        def var_width
            HeightDefinedVarWidth.new(@container)
        end
    
        def full_width
            @container.left = 0.0
            @container.right = 0.0
            @container
        end
    end
    
    class WidthDefinedFixedHeight
    
        def initialize(container)
            @container = container
        end
    
        def anchor_top(margin=0.0)
            @container.top = margin
            @container
        end
    
        def anchor_bottom(margin=0.0)
            @container.bottom = margin
            @container
        end
    
        def center
            @container
        end
    end
    
    class WidthDefinedVarHeight
    
        def initialize(container)
            @container = container
        end
    
        def margins(top_margin, bottom_margin=nil)
            if bottom_margin.nil?
                bottom_margin = top_margin
            end
            @container.top = top_margin
            @container.bottom = bottom_margin
            @container
        end
    end
    
    class HeightDefinedFixedWidth
    
        def initialize(container)
            @container = container
        end
    
        def anchor_left(margin=0.0)
            @container.left = margin
            @container
        end
    
        def anchor_right(margin=0.0)
            @container.right = margin
            @container
        end
    
        def center
            @container
        end
    end
    
    class HeightDefinedVarWidth
    
        def initialize(container)
            @container = container
        end
    
        def margins(left_margin, right_margin=nil)
            if right_margin.nil?
                right_margin = left_margin
            end
            @container.left = left_margin
            @container.right = right_margin
            @container
        end
    end
    
    class VarWidthAndHeight
    
        def initialize(container)
            @container = container
        end
    
        def margins(top_margin, right_margin=nil, bottom_margin=nil, left_margin=nil)
            if right_margin.nil?
                right_margin = top_margin
            end
            if bottom_margin.nil?
                bottom_margin = top_margin
            end
            if left_margin.nil?
                left_margin = right_margin
            end
            @container.top = top_margin
            @container.right = right_margin
            @container.left = left_margin
            @container.bottom = bottom_margin
            @container
        end
    end
    
end