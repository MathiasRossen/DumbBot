#https://regex101.com/r/RbinEo/1/

require "./config/application.rb"
#require "./modules/commands/handler.rb"
# require "json"
# require "fileutils"

#command_handler = Commands::Handler.new
#response = command_handler.handle("!assbringer")
# url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
# #url = "qwe.invalidurl.qwe"
# id = `youtube-dl --id --get-filename #{url}`
# id = id.gsub(/\..+/, "").strip!
# `youtube-dl --write-info-json -f 'bestaudio' -o 'assets/temp/%(id)s.%(ext)s' #{url}`
# p "HESTY"
# p id
 #p JSON.parse(File.open("#{id}.info.json").read)

require "discordrb/api"

#p Discordrb::API::Channel.create_message(Conf.api_token, 230585284159471617, "Hello world!")