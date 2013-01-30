# encoding: utf-8

require 'working/rake_tasks'

task :i => :interact_here
task :pry => :interact_here
task :interact_here do
  sh *%w(bundle exec pry -Ilib -rpry-docmore) + ARGV[1..-1]
end

def in_wiki_dir
  Dir.chdir 'pry-docmore.wiki' do yield end
end

task :fe do
  in_wiki_dir do
    puts 'Hey! This thing needs to be tested IRL (hit enter).'; $stdin.readline
    sh 'git fetch'
    sh 'git diff @{u}'
  end
end

task :yaml do
  all = {}
  in_wiki_dir do
    Dir['*.md'].each do |e|
      all[e.sub /\.md$/, ''] = File.read(e)
    end
  end
  File.write 'docmores.yaml', YAML.dump(all)
end
