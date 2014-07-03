class AddFieldsInConferences < ActiveRecord::Migration
  def change
  remove_column :conferences, :datetime,:string
  add_column :conferences, :start_datetime,:string
  add_column :conferences, :end_datetime,:string
  end
end
