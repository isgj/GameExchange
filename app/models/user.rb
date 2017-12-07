class User < ApplicationRecord
  has_many :active_friendships, class_name: "Friendship",
                          foreign_key: "friender_id",
                          dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship",
                          foreign_key: "friended_id",
                          dependent: :destroy
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

  #Da perfezionare con il fatto dell'accetazione della richiesta

  def friends
     Friendship.where("friender_id = ? or friended_id = ?", self.id, self.id)
  end

  #Add a friends
  def add_friend(other_user)
    self.active_friendships.create(friended_id: other_user.id)
  end

  #Remove a friends
  def unfriend(other_user)
    @friendship = Friendship.find_by_friender_id(self) && Friendship.find_by_friended_id(other_user)
    if @friendship == nil
      @friendship = Friendship.find_by_friender_id(other_user) && Friendship.find_by_friended_id(self)
    end
    if @friendship != nil
      Friendship.delete(@friendship.id)
    end
  end

  #Returns true if the users are friends
  def friends?(other_user)
    self.friends.find_by_friended_id(other_user) != nil || self.friends.find_by_friender_id(other_user) != nil
  end
end
