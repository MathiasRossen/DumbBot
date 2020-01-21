require "./config/application.rb"

bot = Discordrb::Bot.new token: Conf.token

bot.message(start_with: "!") do |event|
  response = CommandsHandler.handle(event.message)
  event.respond(response)
end

bot.run