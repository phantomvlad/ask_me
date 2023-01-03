class DeleteUserNicknameToQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :user_nickname
  end
end
