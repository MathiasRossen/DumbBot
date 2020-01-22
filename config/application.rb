require "active_record"
require "require_all"
require "discordrb"
require "./config/conf.rb"
require_all "models/*.rb"

db_config = YAML::load(File.open("config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)