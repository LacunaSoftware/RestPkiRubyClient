module RestPki
    class PdfHelper
        def initialize; end

        def container
            PdfContainerDefinition.new
        end

        def mark
            PdfMark.new
        end

        def text_element
            PdfMarkTextElement.new
        end

        def image_element
            PdfMarkImageElement.new
        end

        def qr_code_element
            PdfMarkQRCodeElement.new
        end

        def text_section(text=nil)
            PdfTextSection.new(text)
        end
    end
end