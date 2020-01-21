#https://regex101.com/r/RbinEo/1/
require "net/http"

class CommandsHandler
  @@prefix = "!"

  def self.set_prefix prefix
    @@prefix = prefix
  end

  def self.handle request
    full_command = request.to_s[@@prefix.length..-1].scan /".+?"|[\w\d:\/.?=]+/
    command = full_command[0]
    args = full_command - [command]

    if command == "cat"
      cat_command
    else
      "You have no power here!" #request.to_s
    end
  end

  private

  def self.cat_command
    uri = URI("http://aws.random.cat/meow")
    response = Net::HTTP.get_response(uri)

    if response.code == 200
      response.body
    else
      "No cat found"
    end
  end
end