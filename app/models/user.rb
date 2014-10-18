class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    find_or_initialize_by(provider: auth[:provider], uid: auth[:uid]).tap do |user|
      user.name = auth.info.first_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.avatar = auth.info.image
      user.save!
    end
  end
end
