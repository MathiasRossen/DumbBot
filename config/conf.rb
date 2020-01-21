class Conf

  def self.name
    @config["name"]
  end

  def self.token
    @config["token"]
  end
  
  private
  
  @config = YAML::load(File.open("config/bot.yml"))

end