require 'base64'

module RestPki
  class ResourceContentOrReference
    attr_accessor :url, :mime_type, :content

    def initialize
      @url = nil
      @mime_type = nil
      @content = nil
    end

    def to_model
      content = nil
      unless @content.nil?
        content = Base64.encode64(@content)
      end
      {
          url: @url,
          mimeType: @mime_type,
          content: content,
      }
    end
  end
end
