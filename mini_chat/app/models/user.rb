class User < ActiveRecord::Base
  has_many :comments, dependent: :delete_all

  def self.from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid
    info = auth.info.symbolize_keys!
    user = User.find_or_initialize_by(uid: uid, provider: provider)
    user.name = info.name
    user.avatar_url = info.image
    user.profile_url = info.urls.send(provider.capitalize.to_sym)
    user.save!
    user
  end
end
