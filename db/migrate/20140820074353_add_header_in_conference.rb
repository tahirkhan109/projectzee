class AddHeaderInConference < ActiveRecord::Migration
  def change
    add_column :conferences, :conf_header,:string
  end
end
