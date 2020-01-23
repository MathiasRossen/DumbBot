class User < ActiveRecord::Base
  def self.log discord_user
    unless discord_user.bot_account?
      user = User.find_or_create_by(id: discord_user.id)
      user.update id: discord_user.id, name: discord_user.username, discriminator: discord_user.discriminator
    end
  end
end