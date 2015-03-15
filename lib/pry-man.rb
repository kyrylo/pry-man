require 'yaml'

require 'pry-man/manual_storage'
require 'pry-man/commands'

module PryMan
  # The VERSION file must be in the root directory of the library.
  VERSION_FILE = File.expand_path('../../VERSION', __FILE__)

  VERSION = File.exist?(VERSION_FILE) ?
    File.read(VERSION_FILE).chomp : '(could not find VERSION file)'
end
