class SpellBook
  attr_accessor :cli

  def welcome_user
    self.cli.print_welcome
    sleep(2)
    self.cli.print_class_choice_list
  end

  def find_class_by_name
    self.cli.print_choose_class
    dnd_class_input = self.cli.gets_user_input
    found_dnd_class = DnDClass.all.find {|dnd_class| dnd_class.name == dnd_class_input}

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
    found_dnd_spell = dnd_class_input.sb_dnd_spell.find{|dnd_spell| dnd_spell.name == dnd_spell_input}
    
    if (found_dnd_spell == nil)
      self.cli.print_enter_valid_input
      self.find_class_spells_by_name
    else
      found_dnd_spell
    end
  end

  def self.start
    new_spellbook = SpellBook.new
    new_spellbook.cli = CLI.new
    new_spellbook.welcome_user
    dnd_class_input = new_spellbook.find_class_by_name
    dnd_spell_input = new_spellbook.find_class_spells_by_name(dnd_class_input)
    new_spellbook.cli.print_spell_info(dnd_spell_input)
  end
end

#API.start_object_creation

#test1 = DnDSpell.all.find{|dnd_spell| dnd_spell.name == "Acid Arrow"}
#test1.sb_dnd_class.count
#test2 = DnDClass.all.find{|dnd_class| dnd_class.name == "Druid"}
#test2.sb_dnd_spell
#test2.sb_dnd_spell.count
#test3 = DnDClass.all.find{|dnd_class| dnd_class.name == "Wizard"}
#test3.sb_dnd_spell
#test3.sb_dnd_spell.count
