module Importer

  def self.import_products(content, content_type)
    data = Parsers.parse_file(content, content_type)

    if data.class == Parsers::Message
      data
    else
      import(data)
    end
  end

  def self.import(data)
    begin
      products = []

      data.each do |product|

        p = Product.new(product.except(:categories, :selling_values))

        if product[:categories].present?
          product[:categories].uniq.each do |category|
            p.categories << Category.new({ description: category })
          end
        end

        if product[:selling_values].present?
          product[:selling_values].uniq.each do |selling_value|
            p.selling_values << SellingValue.new({ value: selling_value })
          end
        end

        products << p
      end

      Product.import(products)

      Parsers::Message.success(products.size)
    rescue
      Parsers::Message.import_error
    end
  end

end
