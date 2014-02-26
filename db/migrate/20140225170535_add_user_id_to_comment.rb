class AddUserIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer, null: false, default: 0
  end
end
