class Contribution < ActiveRecord::Base
  belongs_to :breakpoint
  belongs_to :user
  has_one :campaign, through: :breakpoint
end
