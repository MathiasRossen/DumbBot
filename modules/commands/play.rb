require "./config/application.rb"
require "./modules/commands/base.rb"
require "json"
require "./modules/audio_helper.rb"

module Commands

  class Play < Commands::Base
    def initialize
      self.name = "play"
      self.min_args = 1
      self.max_args = 1
    end

    def execute
      channel = event.user.voice_channel
      return "You are not in a voice channel!" unless channel

      bot.voice_connect channel
      url = args[0]
      response = AudioHelper.instance.play url, event
      Discordrb::API::Channel.delete_message(Conf.api_token, event.channel.id, event.message.id)
      response
    end
  end

end