class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.string :title
      t.integer :user_id
      t.integer :category_id

      t.timestamps(null: false)
    end
  end
end
