class CreateQuestionHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :question_hashtags do |t|
      t.references :question, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
