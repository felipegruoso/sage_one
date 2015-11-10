module Parsers

  #
  # This implementation aims to simplify the access
  # to error's message.
  #
  class Error

    UNEXPECTED_ERROR = "An unexpected error has occurred while processing the file."
    INVALID_TYPE     = "The file is not for products."

    attr_reader :message

    def initialize(message = '')
      @message = message
    end

    def self.unexpected_error
      self.new(UNEXPECTED_ERROR)
    end

    def self.invalid_type
      self.new(INVALID_TYPE)
    end

  end

end
