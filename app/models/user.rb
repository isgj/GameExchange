class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :rememberable, :trackable, :validatable, :lockable

  validates_length_of :phone, is: 10, :allow_blank => true
  validates_length_of :age, is: 2, :allow_blank => true
  validates :photo, :format => URI::regexp(%w(http https)), :allow_blank => true


  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
     user.photo = auth.info.image
   end
  end
end
