class CreateFlightDetails < ActiveRecord::Migration
  def change
    create_table :flight_details do |t|
      t.string :airline_name
      t.integer :flight_number
      t.string :departuring_from
      t.string :arriving_at
      t.datetime :departure_time
      t.datetime :arriving_time
      t.string :connections
      t.timestamps
    end
  end
end
