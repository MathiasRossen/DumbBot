require "./config/application.rb"
require "./modules/commands/base.rb"
require "json"
require "./modules/audio_helper.rb"

module Commands

  class Stop < Commands::Base
    def initialize
      self.name = "stop"
      self.requires_admin = true
    end

    def execute
      AudioHelper.instance.stop
    end
  end

end