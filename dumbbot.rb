require "./config/application.rb"
require "./modules/commands/handler.rb"

bot = Discordrb::Bot.new token: Conf.token
command_handler = Commands::Handler.new

bot.message() do |event|

end

bot.message(start_with: command_handler.prefix) do |event|
  unless event.user.bot_account?
    response = command_handler.handle(event.message)
    event.respond(response)
  end
end

bot.run