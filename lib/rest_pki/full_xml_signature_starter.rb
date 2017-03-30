
module RestPki
  class FullXmlSignatureStarter < XmlSignatureStarter

    def initialize(client)
      super(client)
    end

    def start_with_webpki
      if @xml_content.nil?
        raise 'The XML to sign was not set'
      end

      data = get_common_request_data
      response = RestPki::Request.post('Api/XmlSignatures/FullXmlSignature', params=data).call('xml_model')
      response.token
    end

  end
end