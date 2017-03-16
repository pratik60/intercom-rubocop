# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "intercom/rubocop/version"

Gem::Specification.new do |spec|
  spec.name          = "intercom-rubocop"
  spec.version       = Intercom::Rubocop::VERSION
  spec.authors       = ["Brandon Weiss"]
  spec.email         = ["brandon@intercom.io"]

  spec.summary       = "A base RuboCop configuration for use on all Intercom Ruby projects."
  spec.description   = "A base RuboCop configuration for use on all Intercom Ruby projects."
  spec.homepage      = "https://github.com/intercom/intercom-rubocop"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rubocop", "~> 0.47.1"
end
