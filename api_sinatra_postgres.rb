require 'sinatra'
require 'sinatra/base'
require 'sinatra/namespace'
require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'

DB = Sequel.connect(
  adapter: :postgres,
  database: 'sinatra_seq_dev',
  host: 'localhost',
  password: 'password',
  user: 'sinatra_admin',
  max_connections: 10,
  # logger: Logger.new('log/db.log')
)

%w{controllers models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

get '/' do
    "Hi! I am api_sinatra_postgres!\n\n"
end
