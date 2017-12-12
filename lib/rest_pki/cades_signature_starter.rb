require 'base64'

module RestPki
    class CadesSignatureStarter < SignatureStarter
        attr_accessor :encapsulate_content

        def initialize(restpki_client)
            super(restpki_client)
            @file_tosign_content_base64 = nil
            @cms_tocosign_content_base64 = nil
        end

        #region set_file_tosign

        def set_file_tosign_from_path(path)
            file = File.open(path, 'rb')
            @file_tosign_content_base64 = Base64.encode64(file.read)
            file.close

            @file_tosign_content_base64
        end

        def set_file_tosign_from_raw(content_raw)
            @file_tosign_content_base64 = Base64.encode64(content_raw)
        end

        def set_file_tosign_from_base64(content_base64)
            @file_tosign_content_base64 = content_base64
        end

        def set_file_content_tosign(content_raw)
            set_file_tosign_from_raw(content_raw)
        end

        def set_file_to_sign(path)
            set_file_tosign_from_path(path)
        end

        #endregion

        #region set_cms_tocosign

        def set_cms_tocosign_from_path(path)
            file = File.open(path, 'rb')
            @cms_tocosign_content_base64 = Base64.encode64(file.read)
            file.close

            @cms_tocosign_content_base64
        end

        def set_cms_tocosign_from_raw(content_raw)
            @cms_tocosign_content_base64 = Base64.encode64(content_raw)
        end

        def set_cms_tocosign_from_base64(content_base64)
            @cms_tocosign_content_base64 = content_base64
        end

        def set_cms_content_tocosign(content_raw)
            set_cms_tocosign_from_raw(content_raw)
        end

        def set_cms_tocosign(path)
            set_cms_tocosign_from_path(path)
        end

        #endregion

        def start_with_webpki
            if @file_tosign_content_base64.to_s.blank? and @cms_tocosign_content_base64.to_s.blank?
                raise 'The content to sign was not set and no CMS to be co-signed was given'
            end
            if @signature_policy_id.to_s.blank?
               raise 'The signature policy was not set'
            end

            request = {
                securityContextId: @security_context_id,
                signaturePolicyId: @signature_policy_id,
                callbackArgument: @callback_argument,
                encapsulateContent: @encapsulate_content,
                ignoreRevocationStatusUnknown: @ignore_revocation_status_unknown
            }
            unless @signer_certificate_base64.to_s.blank?
                request['certificate'] = Base64.encode64(@signer_certificate_base64)
            end
            unless @file_tosign_content_base64.nil?
                request['contentToSign'] = @file_tosign_content_base64
            end
            unless @cms_tocosign_content_base64.nil?
                request['cmsToCoSign'] = @cms_tocosign_content_base64
            end

            response = @restpki_client.post('Api/CadesSignatures', request, 'cades_model')

            unless response['certificate'].nil?
                @certificate = response['certificate']
            end
            @done = true

            response['token']
        end

        def start
            if @file_tosign_content_base64.to_s.blank? and @cms_tocosign_content_base64.to_s.blank?
                raise 'The content to sign was not set and no CMS to be co-signed was given'
            end
            if @signature_policy_id.to_s.blank?
                raise 'The signature policy was not set'
            end
            if @signer_certificate_base64.to_s.blank?
                raise 'The signer certificate was not set'
            end

            request = {
                securityContextId: @security_context_id,
                signaturePolicyId: @signature_policy_id,
                callbackArgument: @callback_argument,
                encapsulateContent: @encapsulate_content,
                ignoreRevocationStatusUnknown: @ignore_revocation_status_unknown
            }
            unless @signer_certificate_base64.to_s.blank?
                request['certificate'] = Base64.encode64(@signer_certificate_base64)
            end
            unless @file_tosign_content_base64.nil?
                request['contentToSign'] = @file_tosign_content_base64
            end
            unless @cms_tocosign_content_base64.nil?
                request['cmsToCoSign'] = @cms_tocosign_content_base64
            end

            response = @restpki_client.post('Api/CadesSignatures', request, 'cades_model')

            unless response['certificate'].nil?
                @certificate = response['certificate']
            end
            @done = true

            {
                :token => response['token'],
                :to_sign_data => response['toSignData'],
                :to_sign_hash => response['toSignHash'],
                :digest_algorithm_oid => response['digestAlgorithmOid'],
                :signature_algorithm => get_signature_algorithm(response['digestAlgorithmOid'])
            }
        end
    end
end
