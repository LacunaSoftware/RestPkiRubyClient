module RestPki
  class PdfMarkTextElement < PdfMarkElement
    attr_accessor :text_sections, :align

    def initialize(relative_container=nil, text_sections=[])
      super(PdfMarkElementType::TEXT, relative_container)
      @text_sections = text_sections
      @align = 'Left'
    end

    def to_model
      model = super
      model['textSections'] = @text_sections.map { |s| s.to_model }
      model['align'] = @align
      model
    end

    #region FluentApi

    def align_text_left()
      @align = 'Left'
      self
    end
  
    def align_text_right()
      @align = 'Right'
      self
    end
  
    def align_text_center()
      @align = 'Center'
      self
    end
  
    def add_section(section)
      @text_sections.push(section)
      self
    end
  
    def add_section_with_text(text)
      @text_sections.push(PdfTextSection.new(text))
      self
    end
  
    #endregion
  end
end