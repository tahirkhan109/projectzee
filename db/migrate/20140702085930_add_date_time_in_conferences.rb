class AddDateTimeInConferences < ActiveRecord::Migration
  def change
    add_column :conferences , :datetime, :string
  end
end
