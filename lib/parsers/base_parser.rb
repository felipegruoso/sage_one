module Parsers

  class BaseParser

    def self.parse(args = {})
      self.new(args).safe_parse
    end

    def initialize(args = {})
    end

    def safe_parse
      handle_exception { parse }
    end

    def handle_exception(&block)
      yield

    # For now all errors should be classified as unexpected.
    rescue Exception => e
      return Parsers::Error.unexpected_error
    end

    def parse
      raise NoMethodError.new('Override this method on children classes.')
    end

  end

end
