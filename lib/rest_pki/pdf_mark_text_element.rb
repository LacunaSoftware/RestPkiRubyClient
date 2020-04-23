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
  end
end