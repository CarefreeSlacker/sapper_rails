class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|

      t.timestamps null: false
    end
  end
end
