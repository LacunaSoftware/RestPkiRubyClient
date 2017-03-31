require "rest_pki/version"

require_relative "rest_pki/standard_security_contexts"
require_relative "rest_pki/standard_signature_policies"
require_relative "rest_pki/request"
require_relative "rest_pki/authentication"
require_relative "rest_pki/errors"
require_relative "rest_pki/object"
require_relative "rest_pki/pades_signature"
require_relative "rest_pki/xml_signature_starter"
require_relative "rest_pki/full_xml_signature_starter"
require_relative "rest_pki/namespace_manager"
require_relative "rest_pki/xml_element_signature_starter"
require_relative "rest_pki/xml_id_resolution_table"
require_relative "rest_pki/xml_insertion_options"
require_relative "rest_pki/xml_signature_finisher"

Dir[File.expand_path('../rest_pki/resources/*.rb', __FILE__)].map do |path|
  require path
end

module RestPki
  class << self
    attr_accessor :api_endpoint, :open_timeout, :timeout, :api_key
  end

  self.api_endpoint   = 'https://pki.rest/'
  self.open_timeout   = 30
  self.timeout        = 90
  self.api_key        = nil

end
