class DnDClass
    attr_accessor :name, :slug, :desc, :hit_dice, :hp_at_1st_level, :hp_at_higher_levels, :prof_armor, :prof_weapons, :prof_tools, :prof_saving_throws, :prof_skills, :equipment, :table, :spellcasting_ability, :subtypes_name, :archetypes, :document__slug, :document__title, :document__license_url, :sb_dnd_spell

    @@all = []

    def initialize(attributes)
        attributes.each {|key,value| self.send(("#{key}="), value)}
        self.sb_dnd_spell = []

        @@all << self
    end

    def self.all
        @@all
    end 
end