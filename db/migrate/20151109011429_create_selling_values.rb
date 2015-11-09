class CreateSellingValues < ActiveRecord::Migration
  def change
    create_table :selling_values do |t|
      t.float :value
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
