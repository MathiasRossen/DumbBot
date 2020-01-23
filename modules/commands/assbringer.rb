require "./modules/commands/base.rb"

module Commands

  class Assbringer < Commands::Base
    def initialize
      self.name = "assbringer"
    end

    def execute
      pics = Dir["assets/assbringers/*"]

      if event
        event.channel.send_file(File.open(pics.sample, "r"))
      else
        pics.sample
      end
    end
  end

end