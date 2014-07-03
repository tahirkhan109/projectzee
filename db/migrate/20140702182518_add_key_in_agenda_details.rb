class AddKeyInAgendaDetails < ActiveRecord::Migration
  def change
    add_column :agenda_details ,:attendee_detail_id,:integer
  end
end
