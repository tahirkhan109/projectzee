class CreateAgendaDetails < ActiveRecord::Migration
  def change
    create_table :agenda_details do |t|

      t.timestamps
    end
  end
end
