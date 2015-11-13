class Product < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  has_many :selling_values, dependent: :destroy

  #
  # Imports a set of products.
  #
  # @params [Array] products an array containing all products to be imported.
  #
  def self.import(products = [])
    ActiveRecord::Base.transaction do
      products.each do |product|
        product.save
      end
    end
  end

end
