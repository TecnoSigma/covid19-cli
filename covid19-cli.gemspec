# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative 'lib/covid19-cli/version'

Gem::Specification.new do |spec|
  spec.name          = "covid19-cli"
  spec.version       = Covid19::VERSION
  spec.authors       = ["Alexandre Carlos Martins"]
  spec.email         = ["tecnooxossi@gmail.com"]

  spec.summary       = "COVID-19 Stats"
  spec.description   = "Get COVID19 stats of worldwide"
  spec.homepage      = "https://github.com/TecnoSigma/covid19-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = ["covid19-cli"]
  spec.require_paths = ["lib"]
  
  spec.add_dependency "thor"
  spec.add_dependency "rest-client", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
end
