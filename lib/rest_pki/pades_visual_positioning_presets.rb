
module RestPki
    class PadesVisualPositioningPresets
        @@cached_presets = Hash.new

        def self.get_footnote(restpki_client, page_number=nil, rows=nil)
            url_segment = 'Footnote'
            unless page_number.nil?
                url_segment += '?pageNumber=' + page_number
            end
            unless rows.nil?
                url_segment += '?rows=' + rows
            end
            get_preset(restpki_client, url_segment)
        end

        def self.get_new_page(restpki_client)
            get_preset(restpki_client, 'NewPage')
        end

        private
        def self.get_preset(restpki_client, url_segment)
            if @@cached_presets.has_key? url_segment
                return @@cached_presets[url_segment]
            end
            preset = restpki_client.get("Api/PadesVisualPositioningPresets/#{url_segment}")
            @cached_presets[url_segment] = preset
            preset
        end
    end
end