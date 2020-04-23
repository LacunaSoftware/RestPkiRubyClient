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
      unless color.nil?
        color = @color.nil?
      end
      {
          style: @style,
          text: @text,
          color: color,
          fontSize: @font_size,
      }
    end
  end
end