class Conference < ActiveRecord::Base
  has_many :attendee_details, dependent: :destroy
  belongs_to :user
end
