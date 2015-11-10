require 'test_helper'

class BlueBillTest < ActionController::TestCase

  setup do
    @content = File.readlines("#{Rails.root}/test/static/bluebill_product_file.csv")
  end

  test 'should parse all products' do
    products = Parsers::BlueBill.parse(@content)

    assert_equal(3, products.size)
  end

end
