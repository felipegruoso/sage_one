require 'test_helper'

class BlueBillTest < ActionController::TestCase

  setup do
    @content = File.readlines("#{Rails.root}/test/static/bluebill_product_file.csv", 'r')
  end

  test 'should parse all products' do
    products = Parsers::BlueBill.parse(@content)

    assert_equal(products.size, 3)
  end

  test 'should decode an UTF-8 string' do
    string = "Descri\xE7\xE3o"

    decoded_string = Parsers::BlueBill.new.decode_line(string)

    assert_equal(decoded_string, "Descrição")
  end

end
