# encoding: utf-8

module Parsers

  class BlueBill < Parsers::BaseParser

    ARRAY_KEYS = [:category, :selling_price]

    def parse
      headers  = decode_line(content.shift).split(";").map(&:to_s)
      products = []

      content.each do |line|

        hsh = {}
        decode_line(line).split(";").map(&:to_s).each_with_index do |data, index|
          header = eval(headers[index])
          key    = DICTIONARY[header]
          value  = eval(data)

          if ARRAY_KEYS.include?(key)
            hsh[key] ||= []
          else
            hsh[key] = ''
          end

          hsh[key] << value.to_s
        end

        products << hsh
      end

      products
    end

    def decode_line(line)
      line.force_encoding('ISO-8859-1').encode('UTF-8')
    end

  end

end
