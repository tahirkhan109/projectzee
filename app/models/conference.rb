class Conference < ActiveRecord::Base
  has_many :attendee_details, dependent: :destroy
  validates :title, presence: true
  validates :location, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  belongs_to :user
end
