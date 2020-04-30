module RestPki
    class Oids
        def self.oids
            @oids
        end
        @oids = {
            #region Digest Algorithms
            "MD5" => '1.2.840.113549.2.5',
            "SHA1" => '1.3.14.3.2.26',
            # sha224" => '2.16.840.1.101.3.4.2.4', # RFC 3874 section 4
            "SHA256" => '2.16.840.1.101.3.4.2.1',
            "SHA384" => '2.16.840.1.101.3.4.2.2',
            "SHA512" => '2.16.840.1.101.3.4.2.3',
            #endregion

            #region Signature Algorithms
            "MD2_WITH_RSA" => '1.2.840.113549.1.1.2',
            "MD5_WITH_RSA" => '1.2.840.113549.1.1.4',
            "SHA1_WITH_RSA" => '1.2.840.113549.1.1.5',
            "SHA256_WITH_RSA" => '1.2.840.113549.1.1.11',
            "SHA384_WITH_RSA" => '1.2.840.113549.1.1.12',
            "SHA512_WITH_RSA" => '1.2.840.113549.1.1.13',

            "SHA1_WITH_DSA" => '1.2.840.10040.4.3',   # RFC 3279 section 2.2.2
            # dsaWithSHA224" => '2.16.840.1.101.3.4.3.1',    # RFC 5758 section 3.1
            "SHA256_WITH_DSA" => '2.16.840.1.101.3.4.3.2',    # RFC 5758 section 3.1
            #endregion

            #region Asymmetric Algorithms
            "RSA" => '1.2.840.113549.1.1.1', # RFC 3279 section 2.3.1
            "DSA" => '1.2.840.10040.4.1',    # RFC 3279 section 2.3.2
            #endregion

            #region X509
            "X509_EXTENSION_SUBJECT_ALTERNATIVE_NAME" => '2.5.29.17', # RFC 5280 section 4.2.1.6
            "X509_EXTENSION_BASIC_CONSTRAINTS" => '2.5.29.19', # RFC 5280 section 4.2.1.9
            "X509_EXTENSION_AUTHORITY_KEY_IDENTIFIER" => '2.5.29.35', # RFC 5280 section 4.2.1.1
            "X509_EXTENSION_SUBJECT_KEY_IDENTIFIER" => '2.5.29.14', # RFC 5280 section 4.2.1.2
            "X509_EXTENSION_CRL_NUMBER" => '2.5.29.20', # RFC 5280 section 5.2.3
            "X509_EXTENSION_CRL_REASONS" => '2.5.29.21', # RFC 5280 section 5.3.1
            "X509_EXTENSION_ISSUING_DISTRIBUTION_POINT" => '2.5.29.28', # RFC 5280 section 5.2.5
            "X509_EXTENSION_CERTIFICATE_ISSUER" => '2.5.29.29', # RFC 5280 section 5.3.3
            "X509_EXTENSION_CRL_DISTRIBUTION_POINTS" => '2.5.29.31', # RFC 5280 section 4.2.1.13
            "X509_EXTENSION_NO_REVOCATION_AVAILABLE" => '2.5.29.56', # RFC 5755 section 4.3.6
            "X509_EXTENSION_CERTIFICATE_POLICIES" => '2.5.29.32', # RFC 5280 section 4.2.1.4
            "X509_CERTIFICATE_POLICY_ANY" => '2.5.29.32.0', # RFC 5280 section 4.2.1.4
            "X509_CERTIFICATE_POLICY_QUALIFIER_TYPE_CPS" => '1.3.6.1.5.5.7.2.1', # RFC 5280 section 4.2.1.4
            "X509_CERTIFICATE_POLICY_QUALIFIER_TYPE_USER_NOTICE" => '1.3.6.1.5.5.7.2.2', # RFC 5280 section 4.2.1.4
            "X509_EXTENSION_AUTHORITY_INFORMATION_ACCESS" => '1.3.6.1.5.5.7.1.1', # RFC 5280 section 4.2.2.1
            "ACCESS_DESCRIPTION_CA_ISSUERS" => '1.3.6.1.5.5.7.48.2', # RFC 5280 section 4.2.2.1
            "ACCESS_DESCRIPTION_OCSP" => '1.3.6.1.5.5.7.48.1', # RFC 5280 section 4.2.2.1

            "KEY_USAGE" => '2.5.29.15',
            "EXTENDED_KEY_USAGE" => '2.5.29.37',

            # RFC 5280 section 4.2.1.12
            "EXTENDED_KEY_USAGE_ANY" => '2.5.29.37.0',
            "EXTENDED_KEY_USAGE_SERVER_AUTH" => '1.3.6.1.5.5.7.3.1',
            "EXTENDED_KEY_USAGE_CLIENT_AUTH" => '1.3.6.1.5.5.7.3.2',
            "EXTENDED_KEY_USAGE_CODE_SIGNING" => '1.3.6.1.5.5.7.3.3',
            "EXTENDED_KEY_USAGE_EMAIL_PROTECTION" => '1.3.6.1.5.5.7.3.4',
            "EXTENDED_KEY_USAGE_IPSEC_END_SYSTEM" => '1.3.6.1.5.5.7.3.5',
            "EXTENDED_KEY_USAGE_IPSEC_TUNNEL" => '1.3.6.1.5.5.7.3.6',
            "EXTENDED_KEY_USAGE_IPSEC_USER" => '1.3.6.1.5.5.7.3.7',
            "EXTENDED_KEY_USAGE_TIME_STAMPING" => '1.3.6.1.5.5.7.3.8',
            "EXTENDED_KEY_USAGE_OCSP_SIGNING" => '1.3.6.1.5.5.7.3.9',
            #endregion

            #region ICP-Brasil
            "icpBrasil" => {
                # CAdES
                "CADES_ADR_BASICA_V10" => '2.16.76.1.7.1.1.1',   # DOC-ICP 15.03 v6.1 pag 31
                "CADES_ADR_BASICA_V11" => '2.16.76.1.7.1.1.1.1', # DOC-ICP 15.03 v6.1 pag 31
                "CADES_ADR_BASICA_V20" => '2.16.76.1.7.1.1.2',   # DOC-ICP 15.03 v6.1 pag 31
                "CADES_ADR_BASICA_V21" => '2.16.76.1.7.1.1.2.1', # DOC-ICP 15.03 v6.1 pag 31
                "CADES_ADR_TEMPO_V10" => '2.16.76.1.7.1.2.1',   # DOC-ICP 15.03 v6.1 pag 35
                "CADES_ADR_TEMPO_V11" => '2.16.76.1.7.1.2.1.1', # DOC-ICP 15.03 v6.1 pag 35
                "CADES_ADR_TEMPO_V20" => '2.16.76.1.7.1.2.2',   # DOC-ICP 15.03 v6.1 pag 35
                "CADES_ADR_TEMPO_V21" => '2.16.76.1.7.1.2.2.1', # DOC-ICP 15.03 v6.1 pag 35
                "CADES_ADR_VALIDACAO_V10" => '2.16.76.1.7.1.3.1',   # DOC-ICP 15.03 v6.1 pag 40
                "CADES_ADR_VALIDACAO_V11" => '2.16.76.1.7.1.3.1.1', # DOC-ICP 15.03 v6.1 pag 40
                "CADES_ADR_VALIDACAO_V20" => '2.16.76.1.7.1.3.2',   # DOC-ICP 15.03 v6.1 pag 40
                "CADES_ADR_VALIDACAO_V21" => '2.16.76.1.7.1.3.2.1', # DOC-ICP 15.03 v6.1 pag 40
                "CADES_ADR_COMPLETA_V10" => '2.16.76.1.7.1.4.1',   # DOC-ICP 15.03 v6.1 pag 45
                "CADES_ADR_COMPLETA_V11" => '2.16.76.1.7.1.4.1.1', # DOC-ICP 15.03 v6.1 pag 45
                "CADES_ADR_COMPLETA_V20" => '2.16.76.1.7.1.4.2',   # DOC-ICP 15.03 v6.1 pag 45
                "CADES_ADR_COMPLETA_V21" => '2.16.76.1.7.1.4.2.1', # DOC-ICP 15.03 v6.1 pag 45
                "CADES_ADR_ARQUIVAMENTO_V20" => '2.16.76.1.7.1.5.2',   # DOC-ICP 15.03 v6.1 pag 50
                "CADES_ADR_ARQUIVAMENTO_V21" => '2.16.76.1.7.1.5.2.1', # DOC-ICP 15.03 v6.1 pag 50
                "CADES_ADR_ARQUIVAMENTO_V22" => '2.16.76.1.7.1.4.2.2', # DOC-ICP 15.03 v6.1 pag 50

                # XAdES
                "XADES_ADR_BASICA_V10" => '2.16.76.1.7.1.6.1',   # DOC-ICP 15.03 v6.1 pág 56
                "XADES_ADR_BASICA_V11" => '2.16.76.1.7.1.6.1.1', # DOC-ICP 15.03 v6.1 pág 56
                "XADES_ADR_BASICA_V12" => '2.16.76.1.7.1.6.1.2', # DOC-ICP 15.03 v6.1 pág 56
                "XADES_ADR_BASICA_V20" => '2.16.76.1.7.1.6.2',   # DOC-ICP 15.03 v6.1 pág 56
                "XADES_ADR_BASICA_V21" => '2.16.76.1.7.1.6.2.1', # DOC-ICP 15.03 v6.1 pág 56
                "XADES_ADR_BASICA_V22" => '2.16.76.1.7.1.6.2.2', # DOC-ICP 15.03 v6.1 pág 56
                "XADES_ADR_TEMPO_V10" => '2.16.76.1.7.1.7.1',   # DOC-ICP 15.03 v6.1 pág 60
                "XADES_ADR_TEMPO_V11" => '2.16.76.1.7.1.7.1.1', # DOC-ICP 15.03 v6.1 pág 60
                "XADES_ADR_TEMPO_V12" => '2.16.76.1.7.1.7.1.2', # DOC-ICP 15.03 v6.1 pág 60
                "XADES_ADR_TEMPO_V20" => '2.16.76.1.7.1.7.2',   # DOC-ICP 15.03 v6.1 pág 60
                "XADES_ADR_TEMPO_V21" => '2.16.76.1.7.1.7.2.1', # DOC-ICP 15.03 v6.1 pág 60
                "XADES_ADR_TEMPO_V22" => '2.16.76.1.7.1.7.2.2', # DOC-ICP 15.03 v6.1 pág 60

                # Subject alternative names
                "SAN_CERTIFICADO_PESSOA_FISICA_DADOS_BASICOS" => '2.16.76.1.3.1', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_JURIDICA_NOME_RESPONSAVEL" => '2.16.76.1.3.2', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_JURIDICA_NUMERO_CNPJ" => '2.16.76.1.3.3', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_JURIDICA_DADOS_RESPONSAVEL" => '2.16.76.1.3.4', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_FISICA_DADOS_ELEITORAIS" => '2.16.76.1.3.5', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_FISICA_NUMERO_INSS" => '2.16.76.1.3.6', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_JURIDICA_NUMERO_INSS" => '2.16.76.1.3.7', # DOC-ICP 04.01 v2.3 section 2.5
                "SAN_CERTIFICADO_PESSOA_JURIDICA_NOME_EMPRESARIAL" => '2.16.76.1.3.8', # DOC-ICP 04.01 v2.3 section 2.5
                "ROOT_CERTIFICATE_DECLARATION_PRACTICES" => '2.16.76.1.1.0',
                "SAN_INSCRICAO_OAB" => '2.16.76.1.4.2.1.1', # Política de Certificado de Assinatura Digital Tipo A3 da Autoridade Certificadora da Ordem dos Advogados do Brasil - OAB -- ver 5.0 de 30/11/2014 -- section 7.1.2.3 item a.2 -- http =#icp-brasil.certisign.com.br/repositorio/pc/AC_OAB/PC_A3_AC_OAB_v5.0.pdf

                # Prefixes
                "PREFIX" => '2.16.76.1.',
                "PREFIX_CERTIFICATE_DECLARATION_PRACTICES" => '2.16.76.1.1.',
                "PREFIX_CERTIFICATE_POLICIES" => '2.16.76.1.2.',
                "PREFIX_CERTIFICATE_A1" => '2.16.76.1.2.1.',
                "PREFIX_CERTIFICATE_A2" => '2.16.76.1.2.2.',
                "PREFIX_CERTIFICATE_A3" => '2.16.76.1.2.3.',
                "PREFIX_CERTIFICATE_A4" => '2.16.76.1.2.4.',
                "PREFIX_CERTIFICATE_S1" => '2.16.76.1.2.101.',
                "PREFIX_CERTIFICATE_S2" => '2.16.76.1.2.102.',
                "PREFIX_CERTIFICATE_S3" => '2.16.76.1.2.103.',
                "PREFIX_CERTIFICATE_S4" => '2.16.76.1.2.104.',
                "PREFIX_CERTIFICATE_AC" => '2.16.76.1.2.201.',
                "PREFIX_CERTIFICATE_T3" => '2.16.76.1.2.303.',
                "PREFIX_CERTIFICATE_T4" => '2.16.76.1.2.304.',
            },
            #endregion

            #region CMS
            "DATA_CONTENT_TYPE" => '1.2.840.113549.1.7.1', # RFC 5652 item 4
            "SIGNED_DATA_CONTENT_TYPE" => '1.2.840.113549.1.7.2', # RFC 5652 item 5.1
            "ENVELOPED_DATA_CONTENT_TYPE" => '1.2.840.113549.1.7.3', # RFC 5652 item 6.1
            "DIGESTED_DATA_CONTENT_TYPE" => '1.2.840.113549.1.7.5', # RFC 5652 item 7
            "ENCRYPTED_DATA_CONTENT_TYPE" => '1.2.840.113549.1.7.6', # RFC 5652 item 8
            "AUTHENTICATED_DATA_CONTENT_TYPE" => '1.2.840.113549.1.9.16.1.2', # RFC 5652 item 9.1
            "TST_INFO_CONTENT_TYPE" => '1.2.840.113549.1.9.16.1.4', # RFC 3161 item 2.4.2
            "CONTENT_TYPE_ATTRIBUTE" => '1.2.840.113549.1.9.3', # RFC 5652 item 11.1
            "MESSAGE_DIGEST_ATTRIBUTE" => '1.2.840.113549.1.9.4', # RFC 5652 item 11.2
            "SIGNING_TIME_ATTRIBUTE" => '1.2.840.113549.1.9.5', # RFC 5652 item 11.3
            "SIGNING_CERTIFICATE_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.12', # RFC 2634 item 5.4
            "SIGNING_CERTIFICATE_V2_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.47', # RFC 5035 item 3 ('Insert New Section 5.4.1...')
            "SIGNATURE_TIMESTAMP_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.14', # CAdES v2.2.1 item 6.1.1
            "SIGNER_ATTRIBUTE_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.18', # CAdES v2.2.1 item 6.1.1
            "SIGNATURE_POLICY_IDENTIFIER_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.15', # CAdES v2.2.1 item 5.8.1
            "COMPLETE_CERTIFICATE_REFS_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.21', # CAdES v2.2.1 item 6.2.1
            "COMPLETE_REVOCATION_REFS_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.22', # CAdES v2.2.1 item 6.2.2
            "CERTIFICATE_VALUES_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.23', # CAdES v2.2.1 item 6.3.3
            "REVOCATION_VALUES_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.24', # CAdES v2.2.1 item 6.3.4
            "CADES_C_TIMESTAMP_ATTRIBUTE" => '1.2.840.113549.1.9.16.2.25', # CAdES v2.2.1 item 6.3.5
            "SIGNATURE_POLICY_URI" => '1.2.840.113549.1.9.16.5.1', # CAdES v2.2.1 item 5.8.1
            "CERT_CRL_TIMESTAMP" => '1.2.840.113549.1.9.16.2.26', # CAdES v2.2.1 item 6.3.6
            "ARCHIEVE_TIMESTAMP" => '1.2.840.113549.1.9.16.2.48', # CAdES v2.2.1 item 6.4.1
            #endregion
        }
    end
end