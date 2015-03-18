# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'pry-man'
  s.version      = File.read('VERSION')
  s.date         = Time.now.strftime('%Y-%m-%d')
  s.summary      = 'Documents keywords and special vars'
  s.description  = 'Enhanced show-doc.'
  s.authors      = ['☈king', 'Kyrylo Silin']
  s.email        = 'silin@kyrylo.org'
  s.homepage     = 'https://github.com/kyrylo/pry-man'
  s.license      = 'CC0'

  s.require_path = 'lib'
  s.files        = `git ls-files`.split("\n") + ['man.yaml']

  s.add_dependency 'pry-doc', '~> 0.6.0'
end
