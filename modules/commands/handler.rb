require "./modules/commands/cat.rb"

module Commands

  class Handler
    def prefix
      @prefix ||= "!"
    end

    def prefix= value
      @prefix = value
    end

    def handle request
      full_command = request.to_s[prefix.length..-1].scan /".+?"|[\w\d:\/.?=]+/
      command = full_command[0]
      args = full_command - [command]

      command_instance = Handler.available_commands.select{ |c| c.name == command }.first
      if command_instance
        p command_instance.start args
      else
        p "You have no power here!"
      end
    end

    private

    def self.available_commands
      [
        Commands::Cat.new
      ]
    end
  end

end