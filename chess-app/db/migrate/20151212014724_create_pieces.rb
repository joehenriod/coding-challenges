class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string  :type
      t.integer :x_position
      t.integer :y_position

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
