class AddLostToGames < ActiveRecord::Migration
  def change
    add_column :games, :lost, :boolean
  end
end
