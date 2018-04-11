# coding: utf-8
require_relative 'lib/rest_pki/version'

Gem::Specification.new do |spec|
  spec.name          = 'rest_pki'
  spec.version       = RestPki::VERSION
  spec.license       = 'MIT'
  spec.authors       = ['Murilo Zaffalon', 'Ismael Medeiros']
  spec.email         = %w{mzaffalon@hotmail.com IsmaelM@lacunasoftware.com}
  spec.homepage      = 'https://pki.rest/'
  spec.summary       = 'Client lib for REST PKI'
  spec.description   = 'Classes to consume Lacuna Software REST PKI'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.metadata      = {
      'bug_tracker_uri'   => 'https://github.com/LacunaSoftware/RestPkiRubyClient/issues',
      'changelog_uri'     => 'https://github.com/LacunaSoftware/RestPkiRubyClient/blob/master/CHANGELOG.md',
      'documentation_uri' => 'http://docs.lacunasoftware.com/articles/rest-pki/ruby/index.html',
      'source_code_uri'   => 'https://github.com/LacunaSoftware/RestPkiRubyClient'
  }

  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_dependency 'multi_json', '~> 1.12'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
