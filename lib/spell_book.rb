class SpellBook

  attr_accessor :class_choice, :cli

  def self.create_spellbook
    API.create_classes
    API.create_spells
    new_spellbook = SpellBook.new
    new_spellbook.cli = SpellBook::CLI.new
  end

end