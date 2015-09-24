desc "Check all hosts prior to first deployment"
task :check do
    invoke "check:write_permissions"
end

namespace :check do
    desc "Check that we can access everything"
    task :write_permissions do
        on roles(:all) do |host|
            if test("[ -w #{fetch(:deploy_to)} ]")
                info "#{fetch(:deploy_to)} is writable on #{host}"
            else
                error "#{fetch(:deploy_to)} is not writable on #{host}"
            end
        end
    end
end