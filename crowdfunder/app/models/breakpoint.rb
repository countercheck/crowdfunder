class Breakpoint < ActiveRecord::Base
  has_many :contributions
	belongs_to :campaign
end
