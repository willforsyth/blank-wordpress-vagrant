# config valid only for current version of Capistrano
lock '3.3.5'

set :application, ''

set :tmp_dir, "/tmp"

set :scm, 'git'
set :repo_url, ''
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :linked_files, fetch(:linked_files, []).push(
    
)

set :linked_dirs, fetch(:linked_dirs, []).push(
    'logs'
)
