# encoding: utf-8

module Parsers

  class YouDoInvoice < Parsers::BaseParser

    PRODUCT            = "PRODUTO"
    PRODUCT_IDENTIFIER = "I"

    #
    # Parses the file content into an array of products.
    #
    # @return [Array] a list containing all products to be imported.
    # @raise [TypeError] if the file content is not as expected.
    #
    def parse
      header = decode_line(content.shift)

      type, total = header.split('|')

      raise TypeError if type != PRODUCT

      products = []
      content.each do |line|
        values = decode_line(line.chomp).split("|").map(&:to_s)

        if values.first == PRODUCT_IDENTIFIER

          bar_code = values[9]
          unity    = values[10]
          value    = values[11]

          bar_code = values[3] if bar_code.blank?
          unity    = values[7] if unity.blank?
          value    = values[8] if value.blank?

          product = {
            code:           values[1],
            description:    values[2],
            bar_code:       bar_code,
            ncm:            values[4],
            ipi:            values[5],
            gender:         values[6],
            unity:          unity,
            selling_values: [value],
            stock:          values[12]
          }

          products << product
        end
      end

      products
    end

  end

end
