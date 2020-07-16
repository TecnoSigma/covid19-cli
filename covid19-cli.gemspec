lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "lib/covid19/version"

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

  spec.add_dependency "httparty"
  spec.add_dependency "text-table"
  spec.add_dependency "thor"
  spec.add_dependency "tty-pie"

  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
