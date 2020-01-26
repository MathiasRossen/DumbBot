# https://www.youtube.com/watch?v=dQw4w9WgXcQ

require "./config/application.rb"
require "json"

class AudioHelper
  include Singleton

  def play url, event
    id = get_id url

    return "Invalid URL" unless id

    download url if Dir[id.to_s].empty?

    file = file_hash(id)

    message = if queue.empty?
      "Playing #{file["title"]}"
    else
      "Queued #{file["title"]}"
    end
    
    queue << file["_filename"]

    if @voice.nil?
      Thread.new {
        @voice = event.voice
        run_queue
      }
    end
    
    message
  end

  def stop
    queue.clear
    @voice.destroy if @voice
    @voice = nil
  end

  private

  def run_queue
    while @voice
      unless @voice.playing?
        file = queue.shift

        if file
          @voice.play_file(file)
        else
          @voice = nil
        end
      end

      sleep 5
    end
  end

  def get_id url
    id = `youtube-dl --id --get-filename #{url}`
    id.gsub(/\..+/, "").strip!
  end

  def download url
    `youtube-dl --write-info-json -f 'bestaudio' -o 'assets/temp/%(id)s.%(ext)s' #{url}`
  end

  def file_hash id
    JSON.parse(File.open("assets/temp/#{id}.info.json").read)
  end

  def queue
    @queue ||= []
  end
  
end