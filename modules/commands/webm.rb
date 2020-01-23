require "./modules/commands/base.rb"

module Commands

  class Webm < Commands::Base
    def initialize
      self.name = "webm"
    end

    def execute
      webms = Dir["assets/webm/*"]

      if event
        event.channel.send_file(File.open(webms.sample, "r"))
      else
        webms.sample
      end
    end
  end

end