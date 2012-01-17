# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pebbles/dajare/version"

Gem::Specification.new do |s|
  s.name        = "pebbles-dajare"
  s.version     = Pebbles::Dajare::VERSION
  s.authors     = ["Tatsuya Sato"]
  s.email       = ["satoryu.1981@gmail.com"]
  s.homepage    = "http://github.com/satoryu/pebbles-dajare"
  s.summary     = %q{a gem to generate dajare}
  s.description = <<-DESC
  DESC

  s.rubyforge_project = "pebbles-dajare"
  s.required_ruby_version = '>= 1.9.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", '>= 2'
  s.add_runtime_dependency "google_suggest"
end
