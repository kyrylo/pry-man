# encoding: utf-8

require 'working/rake_tasks'

task :i => :interact_here
task :pry => :interact_here
task :interact_here do
  sh *%w(bundle exec pry -Ilib -rpry-docmore) + ARGV[1..-1]
end
