# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'gameopedia-client'
  s.version       = '0.1.0'
  s.date          = '2020-11-07'
  s.summary       = 'A client for the Gameopedia consumer JSON API'
  s.description   = 'A client for the Gameopedia consumer JSON API'
  s.require_paths = ['lib']
  s.authors       = ['Playload']
  s.files         = Dir['lib/gameopedia.rb', 'lib/**/*']
  s.homepage      = 'https://rubygems.org/gems/gameopedia_client'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.7'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'rubocop', '~> 1.0.0'
  s.add_development_dependency 'typhoeus', '~> 1.4'
end
