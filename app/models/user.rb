class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  before_create do
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end
end
