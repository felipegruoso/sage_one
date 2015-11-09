class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :unity
      t.text :description
      t.text :identification
      t.float :cost
      t.text :observation
      t.text :provider
      t.float :stock
      t.text :bar_code
      t.float :min_stock
      t.float :max_stock
      t.float :stock_purchase
      t.float :factor
      t.text :ncm
      t.text :brand
      t.float :weight
      t.float :size
      t.boolean :inactive
      t.integer :type
      t.text :composition
      t.text :feedstock
      t.text :expedient_material
      t.boolean :for_sale
      t.text :currency
      t.text :code
      t.text :ipi
      t.text :gender

      t.timestamps null: false
    end
  end
end
