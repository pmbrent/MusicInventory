class User < ActiveRecord::Base

  validates :email, :password_digest, :session_token, null: false
  validates :password, length: { minimum: 6, allow_null: true }
  validate  :ensure_session_token

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    
  end

private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
