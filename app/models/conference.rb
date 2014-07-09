class Conference < ActiveRecord::Base
  has_many :attendee_details, dependent: :destroy
  validates :title, presence: true, :uniqueness => true
  validates :location, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  belongs_to :user
  validate :date_validation
  def date_validation
    if self[:end_datetime] < self[:start_datetime]
      errors[:end_datetime] << "Should Be Greater Then Start Datetime"
      return false
    else
      return true
    end
  end
end
