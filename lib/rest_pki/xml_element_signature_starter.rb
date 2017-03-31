
module RestPki
  class XmlElementSignatureStarter < XmlSignatureStarter
    attr_accessor :element_tosign_id, :id_resolution_table

    def initialize
    end

    def start_with_webpki
      if @xml_content.nil?
        raise 'The XML to sign was not set'
      end
      if @element_tosign_id.nil? or @element_tosign_id == ''
        raise 'The XML element id to sign was not set'
      end

      data = get_common_request_data
      data['elementToSignId'] = @element_tosign_id
      if @id_resolution_table
        data['idResolutionTable'] = @id_resolution_table.to_model
      end

      response = RestPki::Request.post('Api/XmlSignatures/XmlElementSignature', params=data).call('xml_model')
      response.token
    end

  end
end