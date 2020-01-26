require "./config/application.rb"

class User < ActiveRecord::Base
  def self.log discord_user
    unless discord_user.bot_account?
      user = User.find_or_create_by(id: discord_user.id)

      if user.name != discord_user.username || user.discriminator != discord_user.discriminator
        user.update id: discord_user.id, name: discord_user.username, discriminator: discord_user.discriminator, admin: user.super_admin?
      end
    end
  end

  def super_admin?
    id == Conf.superadmin_id
  end
end