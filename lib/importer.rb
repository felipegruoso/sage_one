module Importer

  #
  # Imports all products of the given file.
  #
  # @param [Array] content an array containing the file lines.
  # @param [String] content_type the file format.
  #
  # @return [Parsers::Message] a message with the process result.
  #
  def self.import_products(content, content_type)
    data = Parsers.parse_file(content, content_type)

    if data.class == Parsers::Message
      data
    else
      import(data)
    end
  end

  #
  # Imports all products of the given file.
  #
  # @param [Array] data an array containing the products to import.
  #
  # @return [Parsers::Message] a message with the process result.
  #
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
