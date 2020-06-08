class Spells
    attr_accessor :slug, :name, :desc, :higher_level, :page, :range, :components, :material, :ritual, :duration, :concentration, :casting_time, :level, :level_int, :school, :dnd_class, :archetype, :circles, :document__slug, :document__title, :document__license_url 

    @@all = []

    def initialize(attributes)
        attributes.each {|key,value| self.send(("#{key}="), value)}
        @@all << self
    end

    def self.all
        @@all
    end
end