class Campaign < ActiveRecord::Base
	has_many :breakpoints
  has_many :contributions, :through => :breakpoints
end
