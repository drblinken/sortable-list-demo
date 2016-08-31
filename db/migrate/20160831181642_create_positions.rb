class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.references :item, foreign_key: true
      t.references :list, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
