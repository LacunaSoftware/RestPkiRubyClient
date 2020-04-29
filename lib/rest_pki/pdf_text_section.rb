module RestPki
  class PdfTextSection
    attr_accessor :text, :color, :font_size, :style

    def initialize(text=nil, color=nil, font_size=nil)
      if color.nil?
        color = Color.from_rgb_string('#000000') # White
      end
      @style = PdfTextStyle::NORMAL
      @text = text
      @color = color
      @font_size = font_size
    end

    def to_model
      color = nil
      unless @color.nil?
        color = @color
      end
      {
          style: @style,
          text: @text,
          color: color,
          fontSize: @font_size,
      }
    end

    #region FluentApi

    def with_font_size(font_size)
      @font_size = font_size
      self
    end
  
    def with_text(text)
      @text = text
      self
    end
  
    def bold
      @style = PdfTextStyle::BOLD
      self
    end
  
    def italic
      @style = PdfTextStyle::ITALIC
      self
    end
  
    def with_color(color)
      @color = color
      self
    end
  
    #endregion
  end
end