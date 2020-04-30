require 'base64'
module RestPki
  class PdfMarker
    attr_accessor :marks, :measurement_units, :page_optimization, :abort_if_signed
    attr_reader :file_content

    def initialize(client)
      @client = client
      @marks = []
      @measurement_units = PadesMeasurementUnits::CENTIMETERS
      @page_optimization = nil
      @abort_if_signed = nil
      @file_content = nil
    end

    def set_file_from_path(path)
      File.open(path, 'rb') do |f|
        @file_content = f.read
      end
    end

    # region set_file

    def set_file_from_content_raw(content_raw)
      @file_content = content_raw
    end

    def set_file_from_content_base64(content_base64)
      content = nil
      unless content_base64.nil?
        content = Base64.decode64(content_base64)
      end
      @file_content = content
    end

    # endregion

    def apply
      if @file_content.nil?
        raise 'No file was provided'
      end

      marks = @marks.map { |m| m.to_model }
      page_optimization = nil
      unless @page_optimization.nil?
        page_optimization = @page_optimization.to_model
      end
      request = {
          marks: marks,
          measurementUnits: @measurement_units,
          pageOptimization: page_optimization,
          abortIfSigned: abort_if_signed
      }
      request['file'] = {
        content: Base64.encode64(@file_content)
      }
      model = @client.post('Api/Pdf/AddMarks', request, 'pdf_marker_model')
      model.file_content
    end
  end
end