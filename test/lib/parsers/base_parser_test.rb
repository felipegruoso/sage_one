require 'test_helper'

class BaseParserTest < ActionController::TestCase

  class Foo < Parsers::BaseParser
  end

  test 'should handle exceptions' do
    assert_raises(Exception) { Parsers.new.parse }
  end

  test 'children classes should override #parse' do
    assert_raises(NoMethodError) { Foo.new.parse }
  end

end
