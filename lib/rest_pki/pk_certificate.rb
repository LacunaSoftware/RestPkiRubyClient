module RestPki
    class PKCertificate
        attr_reader :email_address, :serial_number, :validity_start, :validity_end, :subject_name
        attr_reader :issuer_name, :pki_brazil, :pki_italy, :issuer
        def initialize(model)
            @email_address = model['emailAddress']
            @serial_number = model['serialNumber']
            @validity_start = model['validityStart']
            @validity_end = model['validityEnd']

            if model['subjectName']
               @subject_name = Name.new(model['subjectName'])
            end

            if model['issuerName']
               @issuer_name = Name.new(model['issuerName'])
            end

            if model['pkiBrazil']
               @pki_brazil = PkiBrazilCertificateFields.new(model['pkiBrazil'])
            end

            if model['pkiItaly']
               @pki_italy = PkiItalyCertificateFields.new(model['pkiItaly'])
            end

            if model['issuer']
               @issuer = PKCertificate.new(model['issuer'])
            end
        end
    end
    class PkiItalyCertificateFields
        attr_reader :certificate_type, :codice_fiscale, :id_carta
        def initialize(model)
            @certificate_type = model['certificateType']
            @codice_fiscale = model['codiceFiscale']
            @id_carta = model['idCarta']
        end
    end
    class PkiBrazilCertificateFields
        attr_reader :certificate_type, :cpf, :cnpj, :responsavel, :company_name, :oab_uf, :oab_numero
        attr_reader :rg_numero, :rg_emissor, :rg_emissor_uf, :date_of_birth
        def initialize(model)
            @certificate_type = model['certificateType']
            @cpf = model['cpf']
            @cnpj = model['cnpj']
            @responsavel = model['responsavel']
            @company_name = model['companyName']
            @oab_uf = model['oabUF']
            @oab_numero = model['oabNumero']
            @rg_numero = model['rgNumero']
            @rg_emissor = model['rgEmissor']
            @rg_emissor_uf = model['rgEmissorUF']
            if model['dateOfBirth']
               @date_of_birth = Date.new(model['dateOfBirth'])
            end
        end
        def cpfFormatted
            if @cpf.to_s.empty?
               return ''
            end
            unless @cpf.gsub(/[.-]/, "").length == 11
               return @cpf
            end
            return @cpf.gsub(/[.-]/, "").gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
         end
      
        def cnpjFormatted
            if @cnpj.to_s.empty?
               return ''
            end
            unless @cnpj.gsub(/[.-]/, "").length == 14
               return @cnpj
            end
            return @cnpj.gsub(/[.-]/, "").gsub(/\A(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})\Z/, "\\1.\\2.\\3/\\4-\\5")
         end
    end
    class Name
        attr_reader :common_name, :country, :dn_qualifier, :email_address, :generation_qualifier, :given_name, :initials
        attr_reader :locality, :organization, :organization_unit, :pseudonym, :serial_number, :state_name, :surname, :title
        def initialize(model)
            @common_name = model['commonName']
            @country = model['country']
            @dn_qualifier = model['dnQualifier']
            @email_address = model['emailAddress']
            @generation_qualifier = model['generationQualifier']
            @given_name = model['givenName']
            @initials = model['initials']
            @locality = model['locality']
            @organization = model['organization']
            @organization_unit = model['organizationUnit']
            @pseudonym = model['pseudonym']
            @serial_number = model['serialNumber']
            @state_name = model['stateName']
            @surname = model['surname']
            @title = model['title']
        end
    end
end