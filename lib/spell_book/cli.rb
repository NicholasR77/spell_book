class CLI
    def print_row
        puts "---------------------"        
    end
    def print_welcome
        self.print_row
        puts "Welcome to the class SpellBook tool using the D&D 5e SRD API."
        puts "This tool allows you to find the spells for any D&D 5e Class."
    end
    def print_class_choice_list
        self.print_row
        puts "Here are the classes available to search from:"
        DnDClass.all.each do |dnd_class|
            puts "#{dnd_class.name}"
        end
    end
    def print_choose_class
        self.print_row
        puts "Please enter the exact name of the class of which you want to view spells, such Barbarian or Cleric. Capitilzation does not matter."
    end

    def print_choose_search_method
        self.print_row
        puts "Please enter the number for how you want to proceed:"
        puts "1: Search spells by name"
        puts "2: Search spells by level"
        puts "3: Search spells by school of magic"
        puts "4: To search using another class"
        puts "5: To exit the program"
    end

    def print_choose_spell_name
        self.print_row
        puts "If you know the name of the spell, such as Fireball or Bane, please enter it. Otherwise, the search will return spells most applicable to the submitted query. Capitilzation does not matter."
    end

    def print_choose_spell_level
        self.print_row
        puts "Please enter the spell level you want to view as 0 through 9, 0 being cantrips. If you want to view mutliple spell levels, please enter each spell level followed by a comma, such as: 0, 1, 2."
    end

    def print_choose_spell_school
        self.print_row
        puts "If you know the name of the school of magic, such as Conjuration or Illusion, please enter it. Otherwise, the search will return spells most applicable to the submitted query. Capitilzation does not matter."
    end

    def print_enter_valid_input
        self.print_row
        puts "Please enter a valid input."
    end

    def print_not_able_to_find_spell
        self.print_row
        puts "Spell wasn't found. Please try again."
    end

    def print_enter_valid_spell_level
        self.print_row
        puts "Please enter a valid spell level of 0 through 9, 0 being cantrips. If you want to view mutliple spell levels, please enter each spell level followed by a comma, such as: 0, 1, 2."
    end

    def print_loading_spells_message
        self.print_row
        puts "One moment as we load your spells...."
    end

    def print_spell_list(dnd_spell_input_arr)
        self.print_row
        puts "Here is a list of spells that fit that search:"
        dnd_spell_input_arr.each do |dnd_spell_input|
            self.print_row
            puts "Name: #{dnd_spell_input.name}"
            puts "Description: #{dnd_spell_input.desc}"
            puts "Casting at Higher Levels: #{dnd_spell_input.higher_level}"
            puts "Physical Book with Page: #{dnd_spell_input.page.upcase}"
            puts "Range: #{dnd_spell_input.range}"
            puts "Components: #{dnd_spell_input.components}"
            puts "Materials: #{dnd_spell_input.material}"
            puts "Ritual: #{dnd_spell_input.ritual.capitalize}"
            puts "Duration: #{dnd_spell_input.duration}"
            puts "Concentration: #{dnd_spell_input.concentration.capitalize}"
            puts "Casting Time: #{dnd_spell_input.casting_time}"
            puts "Base Level: #{dnd_spell_input.level}"
            puts "School of Magic: #{dnd_spell_input.school}"
            puts "Classes Available for Use: #{dnd_spell_input.dnd_class}"
            puts "Archetype Available for Use: #{dnd_spell_input.archetype}"
            puts "Circles Available for Use: #{dnd_spell_input.circles}"
        end
    end

    def gets_user_input
        self.print_row
        gets.strip.downcase
    end
end