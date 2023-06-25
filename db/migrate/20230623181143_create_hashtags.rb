class CreateHashtags < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags do |t|
      t.text :body, null: false, uniqueness: true

      t.timestamps
    end
  end
end
