class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :api_token
      t.integer :note_id

      t.timestamps null: false
    end
  end
end
