class ChangeIdFromAgenda < ActiveRecord::Migration
  def change
    remove_column :agenda_details, :attendee_detail_id,:int
    add_column :agenda_details, :conference_id,:int

  end
end
