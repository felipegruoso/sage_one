module Parsers

  #
  # This implementation aims to simplify the access
  # to error's message.
  #
  class Error

    UNEXPECTED_ERROR = 'An unexpected error has occurred while processing the file.'
    INVALID_TYPE     = 'The file is not for products.'
    INVALID_FILE     = 'The file format is invalid.'
    NO_FILE          = 'No file selected.'
    EMPTY_FILE       = 'The file is empty'

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

    def self.invalid_file
      self.new(INVALID_FILE)
    end

    def self.no_file
      self.new(NO_FILE)
    end

    def self.empty_file
      self.new(EMPTY_FILE)
    end

  end

end
