require 'test_helper'

class ParsersTest < ActionController::TestCase

  class Foo < Parsers::BaseParser
  end

  test 'should handle exceptions' do
    assert_raises(Exception) { Parsers.new.parse }
  end

  test 'children classes should override #parse' do
  end

end
