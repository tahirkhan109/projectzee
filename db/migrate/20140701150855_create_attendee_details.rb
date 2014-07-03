class CreateAttendeeDetails < ActiveRecord::Migration
  def change
    create_table :attendee_details do |t|
       t.string :first_name
       t.string :last_name
       t.string :city
       t.string :state
       t.references :conference

       t.timestamps
    end
  end
end
