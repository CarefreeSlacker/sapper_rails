class AddWaveNumberToCells < ActiveRecord::Migration
  def change
    add_column :cells, :wave_number, :integer, default: nil
  end
end
