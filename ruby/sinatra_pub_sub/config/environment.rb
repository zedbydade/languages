require 'bundler'
Bundler.require

# DB = Sequel.connect(adapter: 'postgres', host: 'localhost', database: 'pub_sub', user: 'postgres', password: 'teste123')

require_all 'app'
