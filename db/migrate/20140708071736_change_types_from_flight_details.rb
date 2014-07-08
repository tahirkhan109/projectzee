class ChangeTypesFromFlightDetails < ActiveRecord::Migration
  def change
    remove_column :flight_details, :departure_time,:datetime
    remove_column :flight_details, :arriving_time,:datetime
    add_column :flight_details, :departure_time,:string
    add_column :flight_details, :arriving_time,:string
  end
end
