class User < ActiveRecord::Base
  has_many :lists
  
  attr_accessible :first_name, :email, :password, :password_confirmation
  
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_presence_of :first_name
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^.+@.+\..+$/
  validates_confirmation_of :password
  
  def self.authenticate(email_param, password_param)
    
    user = find_by_email(email_param)
    
    if user && user.password_hash == BCrypt::Engine.hash_secret(password_param, user.password_salt)
      user
    else
      user
    end
  end
    
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
