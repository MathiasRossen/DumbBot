require "./modules/commands/base.rb"

module Commands

  class Play < Commands::Base
    def initialize
      self.name = "play"
    end

    def execute
      channel = event.user.voice_channel
      return "You are not in a voice channel!" unless channel

      bot.voice_connect channel
      event.voice.play_file("assets/temp/music.mp3")
    end
  end

end