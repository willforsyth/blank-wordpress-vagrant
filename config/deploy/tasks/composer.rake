
require 'capistrano/composer'

namespace :deploy do
    after :starting, :composer do
        SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"
        invoke 'composer:install_executable'
    end
end
