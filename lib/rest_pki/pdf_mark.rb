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
      @page_option = PdfMarkPageOptions::ALL_PAGES
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

    #region FluentApi

    def on_container(container) 
      @container = container
      self
    end

    def with_border_width(border_width) 
      @border_width = border_width
      self
    end

    def on_all_pages
      @page_option = PdfMarkPageOptions::ALL_PAGES
      self
    end

    def on_new_page
      @page_option = PdfMarkPageOptions::NEW_PAGE
      self
    end

    def on_single_page(page_number) 
      @page_option = PdfMarkPageOptions::SINGLE_PAGE
      @page_option_number = page_number
      self
    end

    def on_single_page_from_end(page_number) 
      @page_option = PdfMarkPageOptions::SINGLE_PAGE_FROM_END
      @page_option_number = page_number
      self
    end

    def add_element(element) 
      @elements.push(element)
      self
    end

    def with_border_color(border_color) 
      @border_color = border_color
      self
    end

    def with_background_color(background_color) 
      @background_color = background_color
      self
    end
    #endregion

  end
end