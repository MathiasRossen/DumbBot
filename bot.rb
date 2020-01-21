require "./config/application.rb"

bot = Discordrb::Bot.new token: Conf.token

bot.message(with_text: "Ping!") do |event|
  event.respond "Hi #{event.user.name}!"
end

bot.run