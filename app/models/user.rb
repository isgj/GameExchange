class User < ApplicationRecord
  has_many :active_friendships, class_name: "Friendship",
                          foreign_key: "friender_id",
                          dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship",
                          foreign_key: "friended_id",
                          dependent: :destroy

  has_many :active_requests, class_name: "Request",
                           foreign_key: "applier_id",
                           dependent: :destroy
  has_many :requesting, through: :active_requests, source: :recevier
  has_many :passive_requests, class_name: "Request",
                            foreign_key: "recevier_id",
                            dependent: :destroy
  has_many :requests, through: :passive_requests, source: :applier

  has_many :active_blocks, class_name: "Block",
                          foreign_key: "blocker_id",
                          dependent: :destroy
  has_many :blocking, through: :active_blocks, source: :blocked
  has_many :passive_blocks, class_name: "Block",
                          foreign_key: "blocked_id",
                          dependent: :destroy
  has_many :blockers, through: :passive_blocks, source: :blocker

  has_many :comments, class_name: "Comment", foreign_key: "commented_id", dependent: :destroy
  has_many :comments1, class_name: "Comment", foreign_key: "commentator_id", dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :rememberable, :trackable, :validatable, :lockable

  validates_length_of :phone, is: 10, :allow_blank => true
  validates_length_of :age, is: 2, :allow_blank => true
  validates :photo, :format => URI::regexp(%w(http https)), :allow_blank => true

  has_many :hold_games, class_name: 'Game', foreign_key: 'holder_id'
  has_many :own_games, class_name: 'Game', foreign_key: 'owner_id', dependent: :destroy
  has_many :rented, -> { where("state = ?", 4) }, class_name: 'Game', foreign_key:'owner_id'

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
     user.photo = auth.info.image
   end
  end

#Block methods
  #Block a user
  def block(other_user)
    if self.requests?(other_user)
      self.remove_request(other_user)
    elsif self.friends?(other_user)
      self.unfriend(other_user)
    end
    blocking << (other_user)
  end
  #Return true if the user il blocked
  def blocking?(other_user)
    blocking.include?(other_user)
  end
  #Remove a user from the blocked list
  def unblock(other_user)
    blocking.delete(other_user)
  end

#Request methods
  #Send a friendship request to a user
  def send_request(other_user)
    if self.blocking?(other_user)
      self.unblock(other_user)
    end
    requesting << (other_user)
  end
  #Return true if there is a request pending
  def requests?(other_user)
    requesting.include?(other_user)
  end

  def remove_request(other_user)
    requesting.delete(other_user)
  end
  #Accept a friend request
  def accept_request(other_user)
    self.add_friend(other_user)
    requests.delete(other_user)
  end
  #Refuse a friend request
  def refuses_request(other_user)
    requests.delete(other_user)
  end

#Friendship methods
  def friends
     Friendship.where("friender_id = ? or friended_id = ?", self.id, self.id)
  end

  #Add a friend
  def add_friend(other_user)
    self.active_friendships.create(friended_id: other_user.id)
  end

  #Remove a friend
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
