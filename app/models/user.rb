class User < ApplicationRecord
  has_many :comments, foreign_key: "commented_id",dependent: :destroy
  has_many :comments1, foreign_key: "commentator_id",dependent: :destroy

    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :rememberable, :trackable, :validatable, :lockable

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
     user.photo = auth.info.image
   end
  end
end
