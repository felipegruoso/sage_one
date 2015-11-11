class Product < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  has_many :selling_values, dependent: :destroy

  def self.import(products = [])
    ActiveRecord::Base.transaction do
      products.each do |product|
        product.save
      end
    end
  end

end
