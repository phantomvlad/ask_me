class RemoveAuthorIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :author_id
  end
end
