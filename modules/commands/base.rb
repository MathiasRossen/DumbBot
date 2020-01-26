module Commands

  class Base
    attr_accessor :name
    attr_accessor :min_args
    attr_accessor :max_args
    attr_accessor :requires_admin

    def start args, payload = nil
      return "Too few arguments supplied, expected: #{min_args.to_s}" if args.length < min_args.to_i

      self.bot = payload[:bot]
      self.event = payload[:event]
      self.args = args[0...max_args.to_i]

      if requires_admin 
        user = User.find(event.user.id)
        return "You don't have permission" unless user.admin
      end
      
      execute
    end

    def execute
    end

    private

    attr_accessor :args
    attr_accessor :bot
    attr_accessor :event

    def command_info
      @info_hash ||= YAML::load(File.open("config/command_info.yml"))
      @info_hash[name].to_s
    end

  end

end