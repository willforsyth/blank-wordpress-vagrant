
set :deploy_to, '/home/vagrant/deploy'

server 'localhost', port: '2222', user: 'vagrant', roles: [:web], ssh_options: {
    auth_methods: %w(publickey password),
    password: 'vagrant'
}
