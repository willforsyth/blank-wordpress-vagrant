# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Include tasks from other gems included in Gemfile

# Load custom tasks from `config/deploy/tasks' if you have any defined
Dir.glob('config/deploy/tasks/*.rake').each { |r| import r }
