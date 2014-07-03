class AttendeeDetail < ActiveRecord::Base
  belongs_to :conference
  has_one :flight_detail
  has_one :ground_detail
  has_one :agenda_detail
end
