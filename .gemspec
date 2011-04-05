# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/ripl/rack"
 
Gem::Specification.new do |s|
  s.name        = "ripl-rack"
  s.version     = Ripl::Rack::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/ripl-rack"
  s.summary = "A script/console for rack apps using ripl"
  s.description =  "This ripl plugin provides a console for rack apps."
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'tagaholic'
  s.executables = ['ripl-rack']
  s.add_dependency 'ripl', '>= 0.3.5'
  s.add_dependency 'rack', '>= 1.0'
  s.add_dependency 'rack-test', '>= 0.5'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c} **/deps.rip]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.license = 'MIT'
end
