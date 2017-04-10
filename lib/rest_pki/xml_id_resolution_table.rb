module RestPki
    class XmlIdResolutionTable
        attr_accessor :include_xml_id_attribute, :element_id_attributes, :global_id_attributes

        def initialize(inc_xml_id_attribute=nil)
            @include_xml_id_attribute = inc_xml_id_attribute
            @element_id_attributes = Hash.new
            @global_id_attributes = Hash.new
        end

        def add_global_id_attribute(local_name, namespace=nil)
            @global_id_attributes.push({
               localName: local_name,
               namespace: namespace
            })
        end

        def set_element_id_attribute(element_local_name, element_namespace, attribute_local_name, attribute_namespace=nil)
            @element_id_attributes.push({
                element: {
                    localName: element_local_name,
                    namespace: element_namespace
                },
                attribute: {
                    localName: attribute_local_name,
                    namespace: attribute_namespace
                }
            })
        end

        def to_model
            {
                includeXmlIdAttribute: @include_xml_id_attribute,
                elementIdAttributes: @element_id_attributes,
                globalIdAttributes: @global_id_attributes
            }
        end

    end
end