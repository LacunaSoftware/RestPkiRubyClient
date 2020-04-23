module RestPki
  class PdfMark
    attr_accessor :container, :border_width, :border_color, :background_color, :page_option, :page_option_number
    attr_reader :elements

    def initialize
      @container = nil
      @border_width = 0.0
      @border_color = Color.from_rgb_string('#000000') # Black
      @background_color = Color.from_rgb_string('#FFFFFF', 0) # Transparent
      @elements = []
      @page_option = PdfMarkPageOptions::ALL_PAGE
      @page_option_number = nil
    end

    def to_model
      elements = @elements.map { |e| e.to_model }

      {
          container: @container,
          backgroundColor: @background_color.to_model,
          borderColor: @border_color.to_model,
          borderWidth: @border_width,
          elements: elements,
          pageOption: @page_option,
          pageOptionNumber: @page_option_number,
      }
    end
  end
end