class AttendeeDetail < ActiveRecord::Base
  belongs_to :conference
  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :city, presence: true
  #validates :state, presence: true
  has_one :flight_detail
  has_one :ground_detail
  has_one :agenda_detail

  #before_save :uppercase_first_name
  #before_save :uppercase_last_name
  #
  #  def uppercase_first_name
  #    self.first_name.upcase!
  #  end
  #  def uppercase_last_name
  #    self.last_name.upcase!
  #  end
end
