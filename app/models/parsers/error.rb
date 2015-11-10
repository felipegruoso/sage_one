module Parsers

  #
  # This implementation aims to simplify the access
  # to error's message.
  #
  class Error

    UNEXPECTED_ERROR = "Unexpected Error"

    attr_reader :message

    def initialize(message = '')
      @message = message
    end

    def self.unexpected_error
      self.new(UNEXPECTED_ERROR)
    end

  end

end
