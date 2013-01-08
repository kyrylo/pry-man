# encoding: utf-8

Gem::Specification.new do |gem|
  gem.version = '0.0.4'
  gem.name = 'pry-docmore'
  gem.summary = 'Documents keywords and special vars. Currently uses the `,?` command, but soon plain `?`'
  gem.description = 'Enhanced show-doc (a.k.a ? command) for: ' +
    `cd pry-docmore.wiki/; echo Ruby*`.
    gsub(/Ruby (?:Global|Keyword):?\s*/, '').
    gsub(/\(Dollar[^)]+\)/, '').
    gsub(/\.md/, '').
    gsub(/\s+/, ' ')
  # puts 'Desc is: ' + gem.description
  gem.license = 'CC0'
  gem.homepage = 'https://github.com/rking/pry-docmore/wiki'
  gem.email = 'pry-docmore@sharpsaw.org'
  gem.authors = %w(☈king ConradIrwin)
  %w(pry pry-doc).each {|e| gem.add_dependency e}
  gem.files = Dir['{lib,pry-docmore.wiki}/**/*']
end
