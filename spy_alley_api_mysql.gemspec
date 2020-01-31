require_relative 'lib/spy_alley_api_mysql/version'

Gem::Specification.new do |spec|
  spec.name          = "spy_alley_api_mysql"
  spec.version       = SpyAlleyApiMysql::VERSION
  spec.authors       = ["colin.a.horner"]
  spec.email         = ["colin.a.horner@gmail.com"]

  spec.summary       = "MySQL support plugin for Spy Alley"
  spec.description   = "Handle Mysql Data and converts to application consumabele data for Spy Alley"
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  #spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
