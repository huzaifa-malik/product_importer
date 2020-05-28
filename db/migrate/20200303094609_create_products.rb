class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :part_number, null: false
      t.float :part_price, null: false
      t.string :short_desc
      t.string :branch_id, null: false, index: true

      t.index :part_number, unique: true
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
