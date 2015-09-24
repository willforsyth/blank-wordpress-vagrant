
desc "Setup all hosts ready for first deployment"
task :setup do
    invoke "check"
    on roles(:all) do |host|
        unless test "[ -f #{repo_path} ]"
            invoke "#{scm}:clone"
        end
    end
end
