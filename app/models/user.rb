class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


  has_many :authentications
  has_one :notification_setting

  has_many :user_associated_quotes
  has_many :quotes, :through=> :user_associated_quotes

  has_many :followerships
  has_many :followers, :through => :followerships
  
  has_many :votes


  def full_name
  	self.first_name + self.last_name
  end

  def profile_pic_url
    self.set_profile_pic_url
  end

  def apply_omniauth(omniauth)
    authentications.build(
      :provider => omniauth['provider'], 
      :uid => omniauth['uid'],
      :profile_pic_url_from_provider => omniauth['info']['image'],
   	  :auth_token => omniauth['credentials']['token']).save

    self.first_name = omniauth['info']['name']
    self.username = omniauth['info']['nickname']
    self.set_profile_pic_url = omniauth['info']['image']

  end
end
