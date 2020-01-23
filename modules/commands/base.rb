module Commands

  class Base
    attr_accessor :name
    attr_accessor :min_args
    attr_accessor :max_args

    def start args, payload = nil
      if args.length < min_args.to_i
        return "Too few arguments supplied, expected #{min_args.to_s}. Correct usage: #{command_info}"
      end

      self.bot = payload[:bot]
      self.event = payload[:event]
      self.args = args[0...max_args.to_i]
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