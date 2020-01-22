require "./modules/commands/base.rb"
require "net/http"
require "json"

module Commands

  class Cat < Commands::Base
    def initialize
      self.name = "cat"
    end

    def execute
      begin
        uri = URI("http://aws.random.cat/meow")
        response = JSON.parse(Net::HTTP.get(uri))

        response["file"]
      rescue SocketError
        "No cat found"
      end
    end
  end

end