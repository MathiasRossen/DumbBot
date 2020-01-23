require "./modules/commands/cat.rb"
require "./modules/commands/assbringer.rb"
require "./modules/commands/webm.rb"
require "./modules/commands/play.rb"

module Commands

  class Handler
    def prefix
      @prefix ||= "!"
    end

    def prefix= value
      @prefix = value
    end

    def handle message, payload = nil
      full_command = message.to_s[prefix.length..-1].scan /".+?"|[\w\d:\/.?=]+/
      command = full_command[0]
      args = full_command - [command]

      command_instance = Handler.available_commands.select{ |c| c.name == command }.first
      if command_instance
        p command_instance.start args, payload
      else
        p "You have no power here!"
      end
    end

    private

    def self.available_commands
      [
        Commands::Cat.new,
        Commands::Assbringer.new,
        Commands::Webm.new,
        Commands::Play.new
      ]
    end
  end

end