#https://regex101.com/r/RbinEo/1/

require "./config/application.rb"
require "./modules/commands/handler.rb"

command_handler = Commands::Handler.new
response = command_handler.handle("!assbringer")