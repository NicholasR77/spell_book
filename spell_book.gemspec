Gem::Specification.new do |spec|
  spec.name          = "spell_book"
  spec.version       = "0.1.0"
  spec.authors       = ["NicholasR77"]
  spec.email         = ["nl7robbins@icloud.com"]

  spec.summary       = "A CLI gem to search for D&D 5e class spells using the D&D SRD API."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["source_code_uri"] = "https://github.com/NicholasR77/spell_book"
 
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "spell_book"
  spec.require_paths = ["lib"]
end
