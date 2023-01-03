class AddReferenceToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :user_nickname
  end
end
