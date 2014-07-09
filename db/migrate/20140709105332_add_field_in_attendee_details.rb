class AddFieldInAttendeeDetails < ActiveRecord::Migration
  def change
    add_column :attendee_details, :is_boarding, :boolean, :default => false
  end
end
