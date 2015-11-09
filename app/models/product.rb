class Product < ActiveRecord::Base
  has_many :categories
  has_many :selling_values
end
