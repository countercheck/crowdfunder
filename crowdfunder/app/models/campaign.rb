class Campaign < ActiveRecord::Base
	has_many :breakpoints
  has_many :contributions, :through => :breakpoints
  belongs_to :user

  def total_funds_raised
    result = 0
    breakpoints.each do |bp|
      total = bp.value_in_cents * bp.contributions.count
      result += total
    end
    result
  end
end
