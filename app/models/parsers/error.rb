module Parsers

  #
  # This implementation aims to simplify the access
  # to error's message.
  #
  class Error

    UNEXPECTED_ERROR = "An unexpected error has occurred while processing the file."

    attr_reader :message

    def initialize(message = '')
      @message = message
    end

    def self.unexpected_error
      self.new(UNEXPECTED_ERROR)
    end

  end

end
