class AddUserNicknameToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :user_nickname, :text
  end
end
