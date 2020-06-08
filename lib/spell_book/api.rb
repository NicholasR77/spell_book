require 'net/http'
require 'json'


class API

    def self.get_api_data(url)
         uri = URI(url)
         response = Net::HTTP.get(uri)
         JSON.parse(response)
    end

    def self.create_spells
        self.get_api_data("https://api.open5e.com/spells/?limit=1").each do |outer_key, outer_value|
            if (outer_key == "results")
                outer_value.each do |value|
                  new_person = Spells.new(value)
                end
            end
        end
    end

end