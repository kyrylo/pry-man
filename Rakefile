# encoding: utf-8

task :i => :interact_here
task :interact_here do
  sh *%w(bundle exec pry -Ilib -rpry-docmore) + ARGV[1..-1]
end

# TODO
#RSpec::Core::RakeTask.new(:rcov) do |spec|
#  spec.pattern = 'spec/**/*_spec.rb'
#  spec.rcov = true
#end

task :default => :tests
