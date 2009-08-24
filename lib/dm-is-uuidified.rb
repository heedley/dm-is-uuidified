require 'rubygems'
require 'pathname'

gem 'dm-core', '0.9.12'
require 'dm-core'

require Pathname(__FILE__).dirname.expand_path / 'dm-is-uuidified' / 'uuid.rb'
require Pathname(__FILE__).dirname.expand_path / 'dm-is-uuidified' / 'is' / 'uuidified.rb'

# Include the plugin in Resource
module DataMapper
  module Model
    include DataMapper::Is::Uuidified
  end # module Model
end # module DataMapper
