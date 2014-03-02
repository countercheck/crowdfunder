class Breakpoint < ActiveRecord::Base
	has_many :contributions
  has_many :user, through: :contributions
  belongs_to :campaign

  validates :title, :description, :estimated_delivery, :value_in_cents, :campaign_id, presence: :true
  validates :value_in_cents, numericality: {only_integer: :true}
  validate :number_available_is_nil_or_int


  def number_available_is_nil_or_int
    if number_available.present? && number_available.class != Fixnum
      errors.add(:number_available, "must be integer or left blank if not applicable")
    end
  end
end
