class User < ActiveRecord::Base
  after_initialize :ensure_session_token
  
  validates :password_digest, presence: true
  validates :password, length: { minimum: 4, allow_nil: true }

  validates :session_token, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    Bcrypt::Password.new(self.password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
