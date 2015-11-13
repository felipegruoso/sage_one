# encoding: utf-8

module Parsers

  class BlueBill < Parsers::BaseParser

    ARRAY_KEYS = [:categories, :selling_values]
    FLOAT_KEYS = [
      :cost, :stock, :min_stock, :max_stock, :stock_purchase,
      :factor, :weight, :size
    ]

    #
    # Parses the file content into an array of products.
    #
    # @return [Array] a list containing all products to be imported.
    #
    def parse
      headers  = decode_line(content.shift).split(";").map(&:to_s)
      products = []

      content.each do |line|

        hsh = {}
        decode_line(line).split(";").map(&:to_s).each_with_index do |data, index|
          header = eval(headers[index])
          key    = DICTIONARY[header]

          if FLOAT_KEYS.include?(key)
            data.gsub!(',', '.')
          end

          if ARRAY_KEYS.include?(key)
            hsh[key] ||= []
          else
            hsh[key] = ''
          end

          value    = eval(data)
          hsh[key] << value.to_s if value.present?
        end

        products << hsh
      end

      products
    end

  end

end
