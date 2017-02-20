class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password


  def authenticate_with_credentials(email, password)

  end

end
