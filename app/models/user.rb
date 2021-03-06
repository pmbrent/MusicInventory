class User < ActiveRecord::Base

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many :notes

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(credentials)
    user = User.find_by_email(credentials[:email])
    user.is_password?(credentials[:password]) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end
