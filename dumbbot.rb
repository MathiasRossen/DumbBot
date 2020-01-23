require "./config/application.rb"
require "./modules/commands/handler.rb"

bot = Discordrb::Bot.new token: Conf.token
command_handler = Commands::Handler.new

bot.message() do |event|
  User.log(event.user)
end

bot.message(start_with: command_handler.prefix) do |event|
  unless event.user.bot_account?
    payload = { bot: bot, event: event }
    response = command_handler.handle(event.message, payload)
    event.respond(response) if response.class == String
  end
end

bot.run