class ChangeProductColumnsType < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :bar_code,           :string
      t.change :brand,              :string
      t.change :code,               :string
      t.change :composition,        :string
      t.change :currency,           :string
      t.change :description,        :string
      t.change :expedient_material, :string
      t.change :feedstock,          :string
      t.change :gender,             :string
      t.change :identification,     :string
      t.change :ipi,                :string
      t.change :ncm,                :string
      t.change :provider,           :string
      t.change :unity,              :string
    end
  end

  def down
    change_table :products do |t|
      t.change :bar_code,           :text
      t.change :brand,              :text
      t.change :code,               :text
      t.change :composition,        :text
      t.change :currency,           :text
      t.change :description,        :text
      t.change :expedient_material, :text
      t.change :feedstock,          :text
      t.change :gender,             :text
      t.change :identification,     :text
      t.change :ipi,                :text
      t.change :ncm,                :text
      t.change :provider,           :text
      t.change :unity,              :text
    end
  end
end
