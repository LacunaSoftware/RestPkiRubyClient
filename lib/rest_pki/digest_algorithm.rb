require 'digest'

module RestPki
    class DigestAlgorithm
        attr_reader :name, :oid, :byte_length, :api_model, :xml_uri, :crypto_digest

        def initialize(name, oid, byte_length, api_model, xml_uri, crypto_digest)
            @name = name
            @oid = oid
            @byte_length = byte_length
            @api_model = api_model
            @xml_uri = xml_uri
            @crypto_digest = crypto_digest
        end

        MD5 = RestPki::MD5
        SHA1 = RestPki::SHA1
        SHA256 = RestPki::SHA256
        SHA384 = RestPki::SHA384
        SHA512 = RestPki::SHA512

        def ==(comparison_object)
            if comparison_object.equal?(self)
                return true
            end
            unless comparison_object.instance_of?(self.class)
                return false
            end
            self.oid == comparison_object.oid
        end

        def check_length(digest_value)
            unless digest_value.length == @byte_length
                raise "A #{@name} digest should contain #{@byte_length} bytes, but a value with #{digest_value.length} bytes was given"
            end
        end

        def self.algorithms
            [
                DigestAlgorithm::MD5,
                DigestAlgorithm::SHA1,
                DigestAlgorithm::SHA256,
                DigestAlgorithm::SHA384,
                DigestAlgorithm::SHA512
            ]
        end
        
        def self.get_instance_by_name(name)
            begin
                alg = DigestAlgorithm.algorithms.find{|a| a.name == name}
            rescue
                raise "Unrecognized digest algorithm name: #{name}"
            end
            alg
        end
        
        def self.get_instance_by_oid(oid)
            begin
                alg = DigestAlgorithm.algorithms.find{|a| a.oid == oid}
            rescue
                raise "Unrecognized digest algorithm oid: #{oid}"
            end
            alg
        end
        
        def self.get_instance_by_xml_uri(xml_uri)
            begin
                alg = DigestAlgorithm.algorithms.find{|a| a.xml_uri == xml_uri}
            rescue
                raise "Unrecognized digest algorithm xml_uri: #{xml_uri}"
            end
            alg
        end
      
        def self.get_instance_by_api_model(algorithm)
            case algorithm.upcase
            when 'MD5'
                DigestAlgorithm::MD5
            when 'SHA1'
                DigestAlgorithm::SHA1
            when 'SHA256'
                DigestAlgorithm::SHA256
            when 'SHA384'
                DigestAlgorithm::SHA384
            when 'SHA512'
                DigestAlgorithm::SHA512
            else
                raise "Unsupported digest algorithm: #{algorithm}"
            end
        end

    end

    class MD5DigestAlgorithm < DigestAlgorithm

        def initialize
            @name = 'MD5'
            @oid = Oids.oids["MD5"]
            @byte_length = 16
            @api_model = 'md5'
            @xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#md5'
            @crypto_digest = Digest::MD5.new
            super(name, oid, byte_length, api_model, xml_uri, crypto_digest)
        end
    end

    class SHA1DigestAlgorithm < DigestAlgorithm

        def initialize
            @name = 'SHA1'
            @oid = Oids.oids["SHA1"]
            @byte_length = 20
            @api_model = 'sha1'
            @xml_uri = 'http://www.w3.org/2000/09/xmldsig#sha1'
            @crypto_digest = Digest::SHA1.new
            super(name, oid, byte_length, api_model, xml_uri, crypto_digest)
        end
    end

    class SHA256DigestAlgorithm < DigestAlgorithm

        def initialize
            @name = 'SHA256'
            @oid = Oids.oids["SHA256"]
            @byte_length = 32
            @api_model = 'sha256'
            @xml_uri = 'http://www.w3.org/2001/04/xmlenc#sha256'
            @crypto_digest = Digest::SHA2.new(256)
            super(name, oid, byte_length, api_model, xml_uri, crypto_digest)
        end
    end

    class SHA384DigestAlgorithm < DigestAlgorithm

        def initialize
            @name = 'SHA384'
            @oid = Oids.oids["SHA384"]
            @byte_length = 48
            @api_model = 'sha384'
            @xml_uri = 'http://www.w3.org/2001/04/xmldsig-more#sha384'
            @crypto_digest = Digest::SHA2.new(384)
        super(name, oid, byte_length, api_model, xml_uri, crypto_digest)
        end
    end

    class SHA512DigestAlgorithm < DigestAlgorithm

        def initialize
            @name = 'SHA512'
            @oid = Oids.oids["SHA512"]
            @byte_length = 64
            @api_model = 'sha512'
            @xml_uri = 'http://www.w3.org/2001/04/xmlenc#sha512'
            @crypto_digest = Digest::SHA2.new(512)
            super(name, oid, byte_length, api_model, xml_uri, crypto_digest)
        end
    end

    MD5 = MD5DigestAlgorithm.new
    SHA1 = SHA1DigestAlgorithm.new
    SHA256 = SHA256DigestAlgorithm.new
    SHA384 = SHA384DigestAlgorithm.new
    SHA512 = SHA512DigestAlgorithm.new
end
