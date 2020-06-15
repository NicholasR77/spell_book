class DnDSpell
    attr_accessor :slug, :name, :desc, :higher_level, :page, :range, :components, :material, :ritual, :duration, :concentration, :casting_time, :level, :level_int, :school, :dnd_class, :archetype, :circles, :document__slug, :document__title, :document__license_url, :sb_dnd_class

    @@all = []

    def initialize(attributes)
        attributes.each {|key,value| self.send(("#{key}="), value)}
        self.sb_dnd_class = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.associate_dnd_class
        DnDSpell.all.each do |dnd_spell|
            split_dnd_class_strings = dnd_spell.dnd_class.split(", ")
            split_dnd_class_strings.each do |split_dnd_class|
                found_dnd_class = DnDClass.all.find {|dnd_class| dnd_class.name == split_dnd_class}
                if (found_dnd_class != nil)
                    dnd_spell.sb_dnd_class << found_dnd_class
                    found_dnd_class.sb_dnd_spell << dnd_spell
                end
            end
        end
    end

end