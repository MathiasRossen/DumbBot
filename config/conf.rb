class Conf

  def self.name
    @config["name"]
  end

  def self.token
    @config["token"]
  end

  def self.api_token
    "Bot #{token}"
  end

  def self.command_prefix
    @config["command_prefix"]
  end

  def self.superadmin_id
    @config["admin_id"]
  end
  
  private
  
  @config = YAML::load(File.open("config/bot.yml"))

end