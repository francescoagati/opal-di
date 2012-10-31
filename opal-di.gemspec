# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name         = 'opal-di'
  s.version      = '0.0.1'
  s.author       = 'Francesco Agati'
  s.email        = 'francescoagati1975@gmail.com'
  s.homepage     = ''
  s.summary      = 'a dependency injection for opal'
  s.description  = 'a dependency injection for opal'

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ['lib']
  
end