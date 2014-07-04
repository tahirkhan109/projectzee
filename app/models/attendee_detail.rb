class AttendeeDetail < ActiveRecord::Base
  belongs_to :conference
  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :city, presence: true
  #validates :state, presence: true
  has_one :flight_detail
  has_one :ground_detail
  has_one :agenda_detail
end
