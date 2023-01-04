class RemoveQuestionsAuthorToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :questions_author_id
  end
end
