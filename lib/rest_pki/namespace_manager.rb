
module RestPki
  class NamespaceManager
    attr_accessor :namespaces

    def initialize
      @namespaces = []
    end

    def add_namespace(prefix, uri)
      ns = { 'prefix': prefix, 'uri': uri }
      @namespaces.push(ns)
    end

  end
end