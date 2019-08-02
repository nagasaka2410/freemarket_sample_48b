class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  has_one :user_detail
  has_one :user_address
  has_one :creditcard

  validates :nickname, presence: true

  accepts_nested_attributes_for :user_address, :user_detail, :creditcard

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

end
