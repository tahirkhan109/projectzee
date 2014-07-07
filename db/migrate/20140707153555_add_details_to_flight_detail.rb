class AddDetailsToFlightDetail < ActiveRecord::Migration
  def change
    remove_column :flight_details, :flight_number,:int
    add_column :flight_details, :flight_number,:string
    add_column :flight_details, :record_locator,:string
  end
end
