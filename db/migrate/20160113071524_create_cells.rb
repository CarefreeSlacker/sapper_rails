class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|
      t.belongs_to :game
      t.integer :x
      t.integer :y
      t.integer :value, default: 0
      t.boolean :open, default: :false
      t.timestamps null: false
    end

    add_index :cells, :game_id
    add_index :cells, :x
    add_index :cells, :y
  end
end
