class ChangeIntegerLimitToUserTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :phone, :integer, limit: 8
  end
end
