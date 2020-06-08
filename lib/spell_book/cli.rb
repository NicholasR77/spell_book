class SpellBook::CLI
    def initialize
       self.print_greeting
    end
    def print_greeting
        puts "Welcome to the Class SpellBook tool using the D&D 5e SRD API."
    end
    def print_class_choice_list
        puts "Here are the classes availabe to search from:"
    end
    def print_choose_class
        puts "Please enter the exact name of the class of which you want to view spells, such Barbarian or Cleric. Capitilzation does not matter."
    end

    def print_enter_valid_input
        puts "Please enter a valid input."
    end

    def print_loading_spells
        puts "One moment as we load your spells...."
    end

    def gets_user_input
        gets.strip.downcase.capitalize
    end
end