class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :id_user, index: true

      t.timestamps
    end
  end
end
