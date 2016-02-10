class UpdateTurnsInGames < ActiveRecord::Migration
  def change
  	change_column :games, :turns, :integer, default: 0, null: false
  end
end
