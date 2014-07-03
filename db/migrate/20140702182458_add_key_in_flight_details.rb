class AddKeyInFlightDetails < ActiveRecord::Migration
  def change
  add_column :flight_details ,:attendee_detail_id,:integer
  end
end
