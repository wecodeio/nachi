# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nachi/version'

Gem::Specification.new do |spec|
  spec.name          = "nachi"
  spec.version       = Nachi::VERSION
  spec.authors       = ["Cristian Rasch"]
  spec.email         = ["cristianrasch@fastmail.fm"]
  spec.summary       = %q{http://nachi-tool.jp/bearing product mass scraper}
  spec.homepage      = "https://github.com/wecodeio/nachi_scraper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "capybara"
  spec.add_runtime_dependency "capybara-webkit"
  # spec.add_runtime_dependency "selenium-webdriver"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
