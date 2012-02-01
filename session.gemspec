# -*- encoding: utf-8 -*-
require File.expand_path('../lib/session/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'session'
  s.version = Session::VERSION.dup

  s.authors  = ['Markus Schirp']
  s.email    = 'mbj@seonic.net'
  s.date     = '2012-02-14'
  s.summary  = 'Agnostic UoW Session'
  s.homepage = 'http://github.com/mbj/session'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.require_paths    = %w(lib)
  s.extra_rdoc_files = %w(README)

  s.rubygems_version = '1.8.10'
  s.add_development_dependency('rspec',     '~> 2.8.0')
end
