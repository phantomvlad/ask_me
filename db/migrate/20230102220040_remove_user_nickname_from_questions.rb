class RemoveUserNicknameFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :user_nickname_id
  end
end
