require 'working/test_helper'
Spork.each_run do
  require 'pry-docmore'
end
# Spork.prefork doesn't like it when this line is missing
