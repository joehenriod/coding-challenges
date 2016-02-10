class AddStatusToPieces < ActiveRecord::Migration
  def change
  	add_column :pieces, :status, :integer, default: 0, null: false
  end
end
