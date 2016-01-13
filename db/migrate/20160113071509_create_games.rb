class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :username
      t.integer :bombs_count
      t.integer :fields_height
      t.integer :fields_width
      t.timestamps null: false
    end
  end
end
