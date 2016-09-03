require 'uri'
require 'rest_client'
require 'multi_json'

module RestPki
  class Authentication
    attr_accessor :security_context_id

    def initialize(security_context_id)
      @security_context_id = security_context_id
    end

    def start_with_web_pki
      RestPki::Request.post('Api/Authentications', params: { securityContextId: self.security_context_id }).call('authentication_model')
    end

    def complete_with_web_pki(token)
      RestPki::Request.post('Api/Authentications/' + token + '/Finalize').call('certificate_model')
    end

  end
end