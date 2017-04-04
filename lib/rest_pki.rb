require 'rest_pki/version'

require_relative 'rest_pki/rest_base_error'
require_relative 'rest_pki/rest_error'
require_relative 'rest_pki/rest_pki_error'
require_relative 'rest_pki/rest_unreachable_error'
require_relative 'rest_pki/validation_error'
require_relative 'rest_pki/object'
require_relative 'rest_pki/authentication'
require_relative 'rest_pki/signature_finisher'
require_relative 'rest_pki/signature_starter'
require_relative 'rest_pki/xml_signature_starter'
require_relative 'rest_pki/full_xml_signature_starter'
require_relative 'rest_pki/namespace_manager'
require_relative 'rest_pki/pades_signature_finisher'
require_relative 'rest_pki/pades_signature_starter'
require_relative 'rest_pki/rest_pki_client'
require_relative 'rest_pki/standard_security_contexts'
require_relative 'rest_pki/standard_signature_policies'
require_relative 'rest_pki/validation_item'
require_relative 'rest_pki/validation_results'
require_relative 'rest_pki/xml_element_signature_starter'
require_relative 'rest_pki/xml_id_resolution_table'
require_relative 'rest_pki/xml_insertion_options'
require_relative 'rest_pki/xml_signature_finisher'

Dir[File.expand_path('../rest_pki/resources/*.rb', __FILE__)].map do |path|
  require path
end

module RestPki
end
