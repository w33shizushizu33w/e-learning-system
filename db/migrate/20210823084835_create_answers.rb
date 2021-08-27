class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :word_id
      t.integer :lesson_id
      t.integer :choice_id

      t.timestamps
    end
  end
end
