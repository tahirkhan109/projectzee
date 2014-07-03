class AddKeyInGroundDetails < ActiveRecord::Migration
  def change
    add_column :ground_details ,:attendee_detail_id,:integer
  end
end
