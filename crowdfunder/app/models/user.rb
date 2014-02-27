class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, presence: true, confirmation: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

  has_many :campaigns
  has_many :contributions
  has_many :breakpoints, through: :contributions

end
