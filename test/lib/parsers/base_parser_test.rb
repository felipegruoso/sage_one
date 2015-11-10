require 'test_helper'

class BaseParserTest < ActionController::TestCase

  class Foo < Parsers::BaseParser
  end

  test 'should handle exceptions' do
    parser = Parsers::BaseParser.new
    result = parser.handle_exception { raise Exception }

    got      = result.message
    expected = Parsers::Error.unexpected_error.message

    assert_equal(expected, got)
  end

  test 'children classes should override #parse' do
    assert_raises(NoMethodError) { Foo.new.parse }
  end

  test 'should decode an UTF-8 string' do
    string = "Descri\xE7\xE3o"

    decoded_string = Parsers::BaseParser.new.decode_line(string)

    assert_equal("Descrição", decoded_string)
  end

end
