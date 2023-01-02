class RenameIdUsersToQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :id_user, :user_id
  end
end
