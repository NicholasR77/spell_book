class CLI
    def print_row
        puts "---------------------"        
    end
    def print_welcome
        self.print_row
        puts "Welcome to the class SpellBook tool using the D&D 5e SRD API."
        puts "This tool allows you to find the spells for any D&D 5e Class."
        self.print_row
    end
    def print_class_choice_list
        puts "Here are the classes available to search from:"
        DnDClass.all.each do |dnd_class|
            puts "#{dnd_class.name}"
        end
        self.print_row
    end
    def print_choose_class
        puts "Please enter the exact name of the class of which you want to view spells, such Barbarian or Cleric. Capitilzation does not matter."
        self.print_row
    end

    def print_choose_spell_name
        puts "If you know the name of the spell, please enter it. Capitilzation does not matter."
        self.print_row
    end

    def print_enter_valid_input
        puts "Please enter a valid input."
        self.print_row
    end

    def print_loading_spells_message
        puts "One moment as we load your spells...."
        self.print_row
    end

    def print_spell_info(dnd_spell_input)
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
        self.print_row
    end

    def gets_user_input
        gets.strip.downcase.capitalize
    end
end