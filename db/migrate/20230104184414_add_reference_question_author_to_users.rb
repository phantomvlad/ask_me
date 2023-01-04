class AddReferenceQuestionAuthorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :questions_author
  end
end
