require 'net/http'
require 'json'

class API
    def self.get_api_data(url)
         uri = URI(url)
         response = Net::HTTP.get(uri)
         JSON.parse(response)
    end

    def self.create_objects(url, class_input)
        self.get_api_data(url).each do |outer_key, outer_value|
            if (outer_key == "results")
                outer_value.each do |value|
                  new_class = class_input.new(value)
                end
            end
        end
    end

    def self.start_object_creation
      API.create_objects("https://api.open5e.com/classes/?limit=1000", DnDClass)
      API.create_objects("https://api.open5e.com/spells/?limit=1000", DnDSpell)
      DnDSpell.associate_dnd_class
    end

end

#API.start_object_creation
#test = DnDSpell.all.find{|spell| spell.name == "Acid Arrow"}
#test.sb_dnd_class