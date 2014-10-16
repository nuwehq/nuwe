# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nuwe/version'

Gem::Specification.new do |spec|
  spec.name          = "nuwe"
  spec.version       = Nuwe::VERSION
  spec.authors       = ["Joost Baaij"]
  spec.email         = ["joost@spacebabies.nl"]
  spec.summary       = %q{Official Ruby client for Nuwe.}
  spec.description   = %q{Official Ruby client for Nuwe.}
  spec.homepage      = "https://api.nuapi.co/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
