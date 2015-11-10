require 'test_helper'

class YouDoInvoiceTest < ActionController::TestCase

  setup do
    @content = File.readlines("#{Rails.root}/test/static/youdoinvoice_product_file.txt")
  end

  test 'should parse all products' do
    products = Parsers::YouDoInvoice.parse(@content)

    assert_equal(4, products.size)
  end

  test "shouldn't parse a file when its header is not for Product" do
    @content[0] = "ITEM|10\n"

    got      = Parsers::YouDoInvoice.parse(@content).message
    expected = Parsers::Error.invalid_type.message

    assert_equal(expected, got)
  end

end
