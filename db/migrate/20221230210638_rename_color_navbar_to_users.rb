class RenameColorNavbarToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :color_navbar, :navbar_color
  end
end
