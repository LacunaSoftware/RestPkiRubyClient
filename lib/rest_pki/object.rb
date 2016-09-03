module RestPki
  class RestPkiObject
    attr_reader :attributes

    RESOURCES = Dir[File.expand_path('../resources/*.rb', __FILE__)].map do |path|
      File.basename(path, '.rb').to_sym
    end

    def initialize(response = {}, object)
      @attributes         = Hash.new
      @unsaved_attributes = Set.new
      update(response, object)
    end

    def []=(key,value)
      @attributes[key] = value
      @unsaved_attributes.add key
    end

    def empty?
      @attributes.empty?
    end

    def ==(other)
      self.class == other.class && id == other.id
    end

    def to_hash
      Hash[@attributes.map do |key, value|
        [ key, to_hash_value(value, :to_hash) ]
      end]
    end

    def respond_to?(name, include_all = false)
      return true if name.to_s.end_with? '='

      @attributes.has_key?(name.to_s) || super
    end

    protected
    def update(attributes, object)
      removed_attributes = @attributes.keys - attributes.keys

      removed_attributes.each do |key|
        @attributes.delete key
      end

      attributes.each do |key, value|
        key = key.to_s

        @attributes[key] = RestPkiObject.convert(value, object)
        @unsaved_attributes.delete key
      end
    end

    def to_hash_value(value, type)
      case value
      when RestPkiObject
        value.send type
      when Array
        value.map do |v|
          to_hash_value v, type
        end
      else
        value
      end
    end

    def method_missing(name, *args, &block)
      name = name.to_s

      unless block_given?
        if name.end_with?('=') && args.size == 1
          attribute_name = name[0...-1]
          return self[attribute_name] = args[0]
        end

        if args.size == 0
          return self[name]
        end
      end

      if attributes.respond_to? name
        return attributes.public_send name, *args, &block
      end

      super name, *args, &block
    end

    class << self

      def convert(response, object)
        case response
        when Array
          response.map{ |i| convert(i, object) }
        when Hash
          resource_class_for(object).new(response, object)                #response['authentication']).new(response)
        else
          response
        end
      end

      protected
      def resource_class_for(resource_name)
        return RestPki::RestPkiObject if resource_name.nil?

        if RESOURCES.include? resource_name.to_sym
          Object.const_get "RestPki::#{capitalize_name resource_name}"
        else
          RestPki::RestPkiObject
        end
      end

      def capitalize_name(name)
        name.gsub(/(\A\w|\_\w)/){ |str| str.gsub('_', '').upcase }
      end

    end
  end
end
