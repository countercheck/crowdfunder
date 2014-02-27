class Breakpoint < ActiveRecord::Base
	has_many :contributions
  has_many :user, through: :contributions
  belongs_to :campaign

end
