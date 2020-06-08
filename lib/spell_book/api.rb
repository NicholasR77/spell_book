require 'net/http'
require 'json'


class API

    def self.get_api_data(url)
         uri = URI(url)
         response = Net::HTTP.get(uri)
         JSON.parse(response)
    end

    def self.create_spells
        self.get_api_data("https://api.open5e.com/spells/?limit=1000").each do |outer_key, outer_value|
            #puts "#{outer_key}" "#{outer_value}"
            if (outer_key == "results")
                outer_value.each do |value|
                  value.each do |inner_key, outer_key|
                    puts "#"
                  end
                end
            end
        end
    end

end