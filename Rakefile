require 'yaml'

task :fetch do
  `git submodule foreach git pull`
end

task :yaml do
  manuals = {}

  Dir.chdir 'pry-man.wiki' do
    Dir['*.md'].each do |man|
      manuals[man.sub(/\.md\z/, '')] = File.read(man)
    end
  end

  File.write 'man.yaml', YAML.dump(manuals)
end

task yaml: [:fetch]
