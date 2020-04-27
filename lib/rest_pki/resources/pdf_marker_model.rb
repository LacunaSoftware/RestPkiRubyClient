require 'base64'
module RestPki
  class PdfMarkerModel
    attr_reader :file_content, :mime_type

    def initialize(model, _)
      file = model['file']
      @file_content = Base64.decode64(file['content'])
      @mime_type = file['mimeType']
    end
  end
end