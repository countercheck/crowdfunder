class Campaign < ActiveRecord::Base
	has_many :breakpoints
  has_many :comments
  has_many :contributions, :through => :breakpoints
  belongs_to :user

  validates :description, :target_in_cents, :title, :start_date, :end_date, :user_id, presence: :true
  validates :title, uniqueness: :true
  validate :campaign_cannot_start_in_past, :campaign_cannot_run_less_than_one_week

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  #acts_as_taggable_on :skills, :interests

  def total_funds_raised
    result = 0
    breakpoints.each do |bp|
      total = bp.value_in_cents * bp.contributions.count
      result += total
    end
    result
  end

  def percent_funds_raised
    (self.total_funds_raised / self.target_in_cents.to_f * 100).round(1)
  end

  def days_before_start
    ((self.start_date - DateTime.now) / 86400).round(1)
  end

  def days_before_end
    ((self.end_date - DateTime.now) / 86400).round(1)
  end

  def total_days
    ((self.end_date - self.start_date) / 86400).round(1)
  end



  def campaign_cannot_start_in_past
    if start_date.present? && start_date < DateTime.now
      errors.add(:start_date, "can't be in the past")
    end
  end
  def campaign_cannot_run_less_than_one_week
    if start_date.present? && end_date.present? && total_days < 7
      errors.add(:end_date, "must be at least 1 week after start date")
    end
  end

end