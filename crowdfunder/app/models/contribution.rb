class Contribution < ActiveRecord::Base
  belongs_to :breakpoint
  belongs_to :backer, class_name: 'User'
  has_one :campaign, through: :breakpoint
end
