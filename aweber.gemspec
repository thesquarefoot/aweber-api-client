# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aweber/version'

Gem::Specification.new do |spec|
	spec.name          = "aweber"
	spec.version       = Aweber::VERSION
	spec.authors       = ["Zachary Flower"]
	spec.email         = ["zachary.flower@pivotdesk.com"]
	spec.summary       = %q{Ruby wrapper for the Aweber API}
	spec.description   = %q{A Ruby wrapper for the Aweber REST API}
	spec.homepage      = "https://github.com/PivotDesk/aweber-api-client"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0")
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]

	spec.add_development_dependency("bundler", ">= 1.7")
	spec.add_development_dependency("rake", ">= 10.0")
	spec.add_development_dependency('rspec', '>= 2.4')

	spec.add_runtime_dependency('faraday', '>= 0.9.0')
	spec.add_runtime_dependency('faraday_middleware', '>= 0.9.0')

	spec.add_runtime_dependency('json', '>= 1.8')
	spec.add_runtime_dependency('simple_oauth', '>= 0.3.1')
	spec.add_runtime_dependency('oauth', '>= 0.4.7')
end
