class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :word
      t.string :answer

      t.timestamps
    end
  end
end
