module RestPki
  class PdfMarkQRCodeElement < PdfMarkElement
    attr_accessor :qr_code_data, :draw_quiet_zone

    def initialize(relative_container = nil, qr_code_data = nil)
      super(PdfMarkElementType::QR_CODE, relative_container)
      @qr_code_data = qr_code_data
      @draw_quiet_zone = false
    end

    def to_model
      model = super
      model['qrCodeData'] = @qr_code_data
      model['qrCodeDataDrawQuietZones'] = @draw_quiet_zone
      model
    end

    #region FluentApi

    def with_qr_code_data(qr_code_data)
      @qr_code_data = qr_code_data
      self
    end
  
    def draw_quiet_zone()
      @draw_quiet_zone = true
      self
    end
  
    #endregion
  end
end