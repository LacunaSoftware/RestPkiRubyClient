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

        def self.MD5WithRSA()
            return RSASignatureAlgorithm.new(DigestAlgorithm.MD5)
        end
      
        def self.SHA1WithRSA()
            return RSASignatureAlgorithm.new(DigestAlgorithm.SHA1)
        end
      
        def self.SHA256WithRSA()
            return RSASignatureAlgorithm.new(DigestAlgorithm.SHA256)
        end
      
        def self.SHA384WithRSA()
            return RSASignatureAlgorithm.new(DigestAlgorithm.SHA384)
        end
      
        def self.SHA512WithRSA()
            return RSASignatureAlgorithm.new(DigestAlgorithm.SHA512)
        end
      
        def self.algorithms()
            return [
               SignatureAlgorithm.MD5WithRSA,
               SignatureAlgorithm.SHA1WithRSA,
               SignatureAlgorithm.SHA256WithRSA,
               SignatureAlgorithm.SHA384WithRSA,
               SignatureAlgorithm.SHA512WithRSA
            ]
        end
      
        def self.safeAlgorithms()
            return [
               SignatureAlgorithm.SHA1WithRSA,
               SignatureAlgorithm.SHA256WithRSA,
               SignatureAlgorithm.SHA384WithRSA,
               SignatureAlgorithm.SHA512WithRSA
            ]
        end
      
        def self.getInstanceByName(name)
            begin
                sig = SignatureAlgorithm._algorithms.find{ |s| s.name == name}
            rescue => exception
                raise 'Unrecognized digest algorithm name: #{name}'
            end
            sig
        end
      
        def self.getInstanceByOid(oid)
            begin
                sig = SignatureAlgorithm._algorithms.find{ |s| s.oid == oid}
            rescue => exception
                raise 'Unrecognized digest algorithm oid: #{oid}'
            end
            sig
        end
      
        def self.getInstanceBy@xml_uri(xml_uri)
            begin
                sig = SignatureAlgorithm._algorithms.find{ |s| s.xml_uri == xml_uri}
            rescue => exception
                raise 'Unrecognized digest algorithm XML URI: #{xml_uri}'
            end
            sig
        end
      
        def self.getInstanceByApiModel(model)
            when model['algorithm']
            when SignatureAlgorithms.MD5_WITH_RSA
                return SignatureAlgorithm.MD5WithRSA
            when SignatureAlgorithms.SHA1_WITH_RSA
                return SignatureAlgorithm.SHA1WithRSA
            when SignatureAlgorithms.SHA256_WITH_RSA
                return SignatureAlgorithm.SHA256WithRSA
            when SignatureAlgorithms.SHA384_WITH_RSA
                return SignatureAlgorithm.SHA384WithRSA
            when SignatureAlgorithms.SHA512_WITH_RSA
                return SignatureAlgorithm.SHA512WithRSA
            else
                raise 'Unsupported signature algorithm: #{model['algorithm']}'
            end
        end
    end
    class RSASignatureAlgorithm < SignatureAlgorithm
        def initialize(digest_algorithm)
            name = '#{digest_algorithm.name} with RSA'
            pk_algorithm = PKAlgorithm.RSA
            oid = null
            xml_uri = null
            case digest_algorithm
            when DigestAlgorithm.MD5
                oid = Oids.MD5_WITH_RSA
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-md5'
                break
            when DigestAlgorithm.SHA1
                oid = Oids.SHA1_WITH_RSA
                xml_uri = 'http://www.w3.org/2000/09/xmldsig#rsa-sha1'
                break
            when DigestAlgorithm.SHA256
                oid = Oids.SHA256_WITH_RSA
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha256'
                break
            when DigestAlgorithm.SHA384
                oid = Oids.SHA384_WITH_RSA
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha384'
                break
            when DigestAlgorithm.SHA512
                oid = Oids.SHA512_WITH_RSA
                xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#rsa-sha512'
                break
            else
                raise 'Unsupported digest algorithm: #{digestA_algorithm}'
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

        def self.RSA
            RSAPKAlgorithm.new()
        end
      
         def self._algorithms
            [PKAlgorithm.RSA]
        end
      
        def self.get_instance_by_name(name)
            begin
                alg = PKAlgorithm.algorithms.find{|a| a.name == name}
            rescue => exception
                raise 'Unrecognized private key algorithm name: #{name}'
            end
            alg
        end
      
        def self.get_instance_by_oid(oid) 
            begin
                alg = PKAlgorithm.algorithms.find{|a| a.name == oid}
            rescue => exception
                raise 'Unrecognized private key algorithm oid: #{oid}'
            end
            alg
        end
      
        def self.get_instance_by_api_model(algorithm)
            case algorithm
            when PKAlgorithms.RSA
                return PKAlgorithm.RSA
            else
                raise 'Unsupported private key algorithms #{algorithm}'
            end
        end
      
    end
    class RSAPKAlgorithm < PKAlgorithm
        def initialize()
            name = 'RSA'
            oid = Oids.RSA
            super(name, oid)
        end
      
        def self.get_signature_algorithm(digest_algorithm)
            return RSASignatureAlgorithm.new(digest_algorithm)
        end
    end
end