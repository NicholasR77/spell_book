require 'net/http'
require 'json'

class API
    #Recieving API data for provided URL.
    def get_api_data(url)
         uri = URI(url)
         response = Net::HTTP.get(uri)
         JSON.parse(response)
    end

    #Instantianting objects for my classes with the data from the API - using Metaprogramming to send the class type the results key from the API data.
    def create_objects(url, class_input)
        self.get_api_data(url).each do |outer_key, outer_value|
            if (outer_key == "results")
                outer_value.each do |value|
                  new_class = class_input.new(value)
                end
            end
        end
    end

    #Calling the create objects method above with given classes and url's
    def start_object_creation
      self.create_objects("https://api.open5e.com/classes/?limit=1000", DnDClass)
      self.create_objects("https://api.open5e.com/spells/?limit=1000", DnDSpell)
    end

end