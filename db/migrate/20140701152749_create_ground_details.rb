class CreateGroundDetails < ActiveRecord::Migration
  def change
    create_table :ground_details do |t|
       t.string :departing_from
       t.string :departure_time
       t.string :destination
       t.string :estimated_transit_time
       t.string :instructions

      t.timestamps
    end
  end
end
