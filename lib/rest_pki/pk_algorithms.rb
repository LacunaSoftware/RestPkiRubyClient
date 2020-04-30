module RestPki

    class SignatureAlgorithm
        attr_reader :name, :oid, :xml_uri, :digest_algorithm, :pk_algorithm
        def initialize(name, oid, xml_uri, digest_algorithm, pk_algorithm)
            @name = name
            @oid = oid
            @xml_uri = xml_uri
            @digest_algorithm = digest_algorithm
            @pk_algorithm = pk_algorithm
        end

        def self.MD5_WITH_RSA; RSASignatureAlgorithm.new(DigestAlgorithm.MD5) end
        def self.SHA1_WITH_RSA; RSASignatureAlgorithm.new(DigestAlgorithm.SHA1) end
        def self.SHA256_WITH_RSA; RSASignatureAlgorithm.new(DigestAlgorithm.SHA256) end
        def self.SHA384_WITH_RSA; RSASignatureAlgorithm.new(DigestAlgorithm.SHA384) end
        def self.SHA512_WITH_RSA; RSASignatureAlgorithm.new(DigestAlgorithm.SHA512) end
      
        def self.algorithms
            [
               SignatureAlgorithm.MD5_WITH_RSA,
               SignatureAlgorithm.SHA1_WITH_RSA,
               SignatureAlgorithm.SHA256_WITH_RSA,
               SignatureAlgorithm.SHA384_WITH_RSA,
               SignatureAlgorithm.SHA512_WITH_RSA
            ]
        end
      
        def self.safe_algorithms
            [
                SignatureAlgorithm.SHA256_WITH_RSA,
                SignatureAlgorithm.SHA384_WITH_RSA,
                SignatureAlgorithm.SHA512_WITH_RSA
            ]
        end
      
        def self.get_instance_by_name(name)
            begin
                sig = SignatureAlgorithm._algorithms.find{ |s| s.name == name}
            rescue => exception
                raise "Unrecognized digest algorithm name: #{name}"
            end
            sig
        end
      
        def self.get_instance_by_oid(oid)
            begin
                sig = SignatureAlgorithm._algorithms.find{ |s| s.oid == oid}
            rescue => exception
                raise "Unrecognized digest algorithm oid: #{oid}"
            end
            sig
        end
      
        def self.get_instance_by_xml_uri(xml_uri)
            begin
                sig = SignatureAlgorithm._algorithms.find{ |s| s.xml_uri == xml_uri}
            rescue => exception
                raise "Unrecognized digest algorithm XML URI: #{xml_uri}"
            end
            sig
        end
      
        def self.get_instance_by_api_model(model)
            algorithm = model['algorithm']
            case algorithm
            when 'MD5WithRSA'
                return SignatureAlgorithm.MD5_WITH_RSA
            when 'SHA1WithRSA'
                return SignatureAlgorithm.SHA1_WITH_RSA
            when 'SHA256WithRSA'
                return SignatureAlgorithm.SHA256_WITH_RSA
            when 'SHA384WithRSA'
                return SignatureAlgorithm.SHA384_WITH_RSA
            when 'SHA512WithRSA'
                return SignatureAlgorithm.SHA512_WITH_RSA
            else
                raise "Unsupported signature algorithm: #{algorithm}"
            end
        end
    end
    class RSASignatureAlgorithm < SignatureAlgorithm
        def initialize(digest_algorithm)
            name = "#{digest_algorithm.name} with RSA"
            pk_algorithm = PKAlgorithm.RSA
            oid = nil
            xml_uri = nil
            case digest_algorithm
            when DigestAlgorithm.MD5
                oid = Oids.oids["MD5_WITH_RSA"]
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-md5'
            when DigestAlgorithm.SHA1
                oid = Oids.oids["SHA1_WITH_RSA"]
                xml_uri = 'http://www.w3.org/2000/09/xmldsig#rsa-sha1'
            when DigestAlgorithm.SHA256
                oid = Oids.oids["SHA256_WITH_RSA"]
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'
            when DigestAlgorithm.SHA384
                oid = Oids.oids["SHA384_WITH_RSA"]
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha384'
            when DigestAlgorithm.SHA512
                oid = Oids.oids["SHA512_WITH_RSA"]
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha512'
            else
                raise "Unsupported digest algorithm: #{digest_algorithm}"
            end

            super(name, oid, xml_uri, digest_algorithm, pk_algorithm)
        end
    end
    class PKAlgorithm
        attr_reader :name, :oid
        def initialize(name, oid)
            @name = name
            @oid = oid
        end
        
        def ==(comparison_object)
            if comparison_object.equal?(self)
                return true
            end
            unless comparison_object.instance_of?(self.class)
                return false
            end
            self.oid == comparison_object.oid
        end

        def self.RSA; RSAPKAlgorithm.new end
      
        def self._algorithms
            [PKAlgorithm.RSA]
        end
      
        def self.get_instance_by_name(name)
            begin
                alg = PKAlgorithm.algorithms.find{|a| a.name == name}
            rescue => exception
                raise "Unrecognized private key algorithm name: #{name}"
            end
            alg
        end
      
        def self.get_instance_by_oid(oid) 
            begin
                alg = PKAlgorithm.algorithms.find{|a| a.name == oid}
            rescue => exception
                raise "Unrecognized private key algorithm oid: #{oid}"
            end
            alg
        end
      
        def self.get_instance_by_api_model(algorithm)
            case algorithm
            when 'RSA'
                return PKAlgorithm.RSA
            else
                raise "Unsupported private key algorithms #{algorithm}"
            end
        end
      
    end
    class RSAPKAlgorithm < PKAlgorithm
        def initialize
            name = 'RSA'
            oid = Oids.oids["RSA"]
            super(name, oid)
        end
      
        def self.get_signature_algorithm(digest_algorithm)
            RSASignatureAlgorithm.new(digest_algorithm)
        end
    end
end