module RestPki
  class PageOptimization
    attr_accessor :paper_size, :page_orientation
    attr_reader :custom_paper_size

    def initialize(paper_size = nil, custom_paper_size = nil, page_orientation = nil)
      @paper_size = paper_size
      @page_orientation = page_orientation
      unless custom_paper_size.nil?
        @custom_paper_size = PadesSize.new(custom_paper_size.width, custom_paper_size.height)
      end
    end

    def custom_paper_size=(value)
      @custom_paper_size = value
      @paper_size = PadesPaperSize::CUSTOM
    end

    def to_model
      custom_paper_size = nil
      if @paper_size.equal?(PadesPaperSize::CUSTOM)
        if @custom_paper_size.nil?
          raise 'The custom paper size parameters was not provided'
        end
        custom_paper_size = @custom_paper_size.to_model
      end
      {
          paperSize: @paper_size,
          customPaperSize: custom_paper_size,
          pageOrientation: @page_orientation,
      }
    end
  end
end