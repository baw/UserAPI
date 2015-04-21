class User < ActiveRecord::Base
  validates :username, :password_diguest, :city, :profession, presence: true
  
  def User.filter_by_city_grouped_by_profession(city)
    User.where(city: city).order :profession
  end
  
  def User.find_by_credentials(username, password)
    user = User.find_by(username: username)
    
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end
  
  def is_password?(password)
    bcrypt_object = BCrypt::Password.new(self.password_diguest)
    
    bcrypt_object.is_password?(password)
  end
  
  def password=(password)
    self.password_diguest = BCrypt::Password.create(password)
  end
end