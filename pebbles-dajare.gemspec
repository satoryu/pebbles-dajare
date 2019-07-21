$LOAD_PATH.push File.expand_path(File.join(__dir__, 'lib'))
require 'pebbles/dajare/version'

Gem::Specification.new do |s|
  s.name        = 'pebbles-dajare'
  s.version     = Pebbles::Dajare::VERSION
  s.authors     = ['Tatsuya Sato']
  s.email       = ['satoryu.1981@gmail.com']
  s.homepage    = 'https://github.com/satoryu/pebbles-dajare'
  s.summary     = 'a gem to generate dajare'
  s.description = <<~DESC
    A gem provides a class for developers to gemerate dajares.
  DESC

  s.rubyforge_project = 'pebbles-dajare'
  s.required_ruby_version = '>= 2.5'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'google_suggest', '~> 1.0.0'
  s.add_development_dependency 'rake', '~> 12.3.2'
  s.add_development_dependency 'rspec', '~> 3.8.0'
end
