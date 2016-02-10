class AddTurnsToGame < ActiveRecord::Migration
  def change
    add_column :games, :turns, :integer
  end
end
