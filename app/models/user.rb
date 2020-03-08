class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]


  scope :all_except, ->(user) { where.not(id: (user.friends + [user]).map(&:id))}


  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships, dependent: :destroy
  has_many :friends, -> { where friendships: { status: :accepted}}, through: :friendships
  has_many :requested_friends, -> { where friendships: { status: :requested}}, through: :friendships, source: :friend
  has_many :pending_friends, -> { where friendships: { status: :pending}}, through: :friendships, source: :friend
  has_many :blocked_friends, -> { where friendships: { status: :blocked}}, through: :friendships, source: :friend

  def friend_request(friend)
    unless self == friend || Friendship.where(user: self, friend: friend).exists?
      transaction do
        Friendship.create(user: self, friend: friend, status: :pending)
        Friendship.create(user: friend, friend: self, status: :requested)
      end
    end
  end
    
  def accept_request(friend)
    transaction do
      Friendship.find_by(user: self, friend: friend, status: [:pending, :requested])&.accepted!
      Friendship.find_by(user: friend, friend: self, status: [:pending, :requested])&.accepted!
    end
  end

  def has_friendship?(friend)
    return true if self == friend
    friendships.map(&:friend_id).include?(friend.id)
  end

  def requested_friends_with?(friend)
    return false if self == friend
    requested_friends.map(&:id).include?(friend.id)
  end
  
  def pending_friends_with?(friend)
    return false if self == friend
    pending_friends.map(&:id).include?(friend.id)
  end
  
  def friends_with?(friend)
    return false if self == friend
    friends.map(&:id).include?(friend.id)
  end

  ...

  def reject_request(friend)
    transaction do
      Friendship.find_by(user: self, friend: friend)&.destroy!
      Friendship.find_by(user: friend, friend: self)&.destroy!
    end
  end

  def full_name
     "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name   # assuming the user model has a name
    end
  end
end
