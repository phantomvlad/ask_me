class AddDefaultVolumeToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :color_navbar, "#370617"
  end
end
