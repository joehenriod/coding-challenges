class AddColorToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :is_white, :boolean
  end
end
