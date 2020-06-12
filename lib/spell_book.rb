class SpellBook
  attr_accessor :cli

  def initialize
    self.cli = CLI.new
    self.welcome_user
  end

  def welcome_user
    self.cli.print_welcome
    sleep(3)
    self.cli.print_class_choice_list
  end

  def find_class_by_name
    self.cli.print_choose_class
    dnd_class_input = self.cli.gets_user_input
    found_dnd_class = DnDClass.all.find {|dnd_class| dnd_class.name.downcase == dnd_class_input}

    if (found_dnd_class == nil)
      self.cli.print_enter_valid_input
      self.find_class_by_name
    else
      found_dnd_class
    end
  end

  def find_class_spells_by_name(dnd_class_input)

    self.cli.print_choose_spell_name

    dnd_spell_input = self.cli.gets_user_input
    found_dnd_spells = []

    if ((dnd_class_input.sb_dnd_spell.any?{|dnd_spell| dnd_spell.name.downcase == dnd_spell_input} == true))
      found_dnd_spells << dnd_class_input.sb_dnd_spell.find {|dnd_spell| dnd_spell.name.downcase == dnd_spell_input}
    else
      dnd_spell_input_split = dnd_spell_input.split(" ")
  
      dnd_spell_input_split.each do |dnd_spell_input| 
        dnd_class_input.sb_dnd_spell.each do |dnd_spell|
          if (dnd_spell.slug.include?(dnd_spell_input) == true)
            found_dnd_spells << dnd_spell
          end
        end
      end
    end
    
    if (found_dnd_spells.length <= 0)
      self.cli.print_not_able_to_find_spell 
      self.find_class_spells_by_name(dnd_class_input)
    else
      found_dnd_spells
    end
  end

  def find_class_spells_by_level(dnd_class_input)

    self.cli.print_choose_spell_level
    dnd_spell_input_split = self.cli.gets_user_input.split(", ").collect {|split_str| split_str.to_i}

    if (dnd_spell_input_split.any? {|split_int| split_int < 0 || split_int > 9} == true)
      self.cli.print_enter_valid_spell_level 
      self.find_class_spells_by_level(dnd_class_input)
    else  
      found_dnd_spells = []
  
      dnd_spell_input_split.each do |dnd_spell_input| 
        dnd_class_input.sb_dnd_spell.each do |dnd_spell|
          if (dnd_spell.level_int == dnd_spell_input)
            found_dnd_spells << dnd_spell
          end
        end
      end

      if (found_dnd_spells.length <= 0)
        self.cli.print_not_able_to_find_spell 
        self.find_class_spells_by_level(dnd_class_input)
      else
        found_dnd_spells.uniq
      end
    end
    
  end

  def find_class_spells_by_school(dnd_class_input)

    self.cli.print_choose_spell_school

    dnd_spell_input = self.cli.gets_user_input
    found_dnd_spells = []

    if ((dnd_class_input.sb_dnd_spell.any?{|dnd_spell| dnd_spell.school.downcase == dnd_spell_input} == true))
      found_dnd_spells << dnd_class_input.sb_dnd_spell.find {|dnd_spell| dnd_spell.school.downcase == dnd_spell_input}
    else
      dnd_spell_input_split = dnd_spell_input.split(" ")
  
      dnd_spell_input_split.each do |dnd_spell_input| 
        dnd_class_input.sb_dnd_spell.each do |dnd_spell|
          if (dnd_spell.school.include?(dnd_spell_input) == true)
            found_dnd_spells << dnd_spell
          end
        end
      end
    end
    
    if (found_dnd_spells.length <= 0)
      self.cli.print_not_able_to_find_spell 
      self.find_class_spells_by_school(dnd_class_input)
    else
      found_dnd_spells
    end
  end

  def start_search
    dnd_class_input = self.find_class_by_name

    search_method_input = 0

    until (search_method_input == 4 || search_method_input == 5 )
      self.cli.print_choose_search_method
      search_method_input = self.cli.gets_user_input.to_i

      if (search_method_input == 1)
        dnd_spell_input = self.find_class_spells_by_name(dnd_class_input)
        self.cli.print_spell_list(dnd_spell_input)
      elsif (search_method_input == 2)  
        dnd_spell_input = self.find_class_spells_by_level(dnd_class_input)
        self.cli.print_spell_list(dnd_spell_input)
      elsif (search_method_input == 3)  
        dnd_spell_input = self.find_class_spells_by_school(dnd_class_input)
        self.cli.print_spell_list(dnd_spell_input)
      elsif (search_method_input == 4)
        self.start_search
      elsif (search_method_input == 5)
        exit
      else
        self.start_search
        self.cli.print_enter_valid_input
      end
    end

  end
end
