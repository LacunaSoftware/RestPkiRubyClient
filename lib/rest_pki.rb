require 'rest_pki/version'

require_relative 'rest_pki/rest_base_error'
require_relative 'rest_pki/rest_error'
require_relative 'rest_pki/restpki_error'
require_relative 'rest_pki/rest_unreachable_error'
require_relative 'rest_pki/validation_error'
require_relative 'rest_pki/object'
require_relative 'rest_pki/authentication'
require_relative 'rest_pki/signature_finisher'
require_relative 'rest_pki/signature_starter'
require_relative 'rest_pki/cades_signature_starter'
require_relative 'rest_pki/cades_signature_finisher'
require_relative 'rest_pki/xml_signature_starter'
require_relative 'rest_pki/full_xml_signature_starter'
require_relative 'rest_pki/namespace_manager'
require_relative 'rest_pki/pades_signature_finisher'
require_relative 'rest_pki/pades_signature_starter'
require_relative 'rest_pki/pades_visual_positioning_presets'
require_relative 'rest_pki/restpki_client'
require_relative 'rest_pki/standard_security_contexts'
require_relative 'rest_pki/standard_signature_policies'
require_relative 'rest_pki/validation_item'
require_relative 'rest_pki/validation_results'
require_relative 'rest_pki/signature_algorithm_and_value'
require_relative 'rest_pki/signature_explorer'
require_relative 'rest_pki/oids'
require_relative 'rest_pki/pades_signature_explorer'
require_relative 'rest_pki/signature_policy_identifier'
require_relative 'rest_pki/digest_algorithm_and_value'
require_relative 'rest_pki/digest_algorithm'
require_relative 'rest_pki/cades_signature'
require_relative 'rest_pki/pades_signer_info'
require_relative 'rest_pki/pk_algorithms'
require_relative 'rest_pki/pk_certificate'
require_relative 'rest_pki/xml_element_signature_starter'
require_relative 'rest_pki/xml_id_resolution_table'
require_relative 'rest_pki/xml_insertion_options'
require_relative 'rest_pki/xml_signature_finisher'
require_relative 'rest_pki/color'
require_relative 'rest_pki/pades_measurement_units'
require_relative 'rest_pki/pades_page_orientation'
require_relative 'rest_pki/pades_paper_size'
require_relative 'rest_pki/pades_size'
require_relative 'rest_pki/page_optimization'
require_relative 'rest_pki/pdf_mark'
require_relative 'rest_pki/pdf_mark_element'
require_relative 'rest_pki/pdf_mark_element_type'
require_relative 'rest_pki/pdf_mark_image'
require_relative 'rest_pki/pdf_mark_image_element'
require_relative 'rest_pki/pdf_mark_page_options'
require_relative 'rest_pki/pdf_mark_qr_code_element'
require_relative 'rest_pki/pdf_mark_text_element'
require_relative 'rest_pki/pdf_marker'
require_relative 'rest_pki/pdf_text_section'
require_relative 'rest_pki/pdf_text_style'
require_relative 'rest_pki/resource_content_or_reference'
require_relative 'rest_pki/pades_visual_rectangle'
require_relative 'rest_pki/pdf_container_definition'
require_relative 'rest_pki/pdf_helper'

Dir[File.expand_path('../rest_pki/resources/*.rb', __FILE__)].map do |path|
  require path
end

module RestPki
end
