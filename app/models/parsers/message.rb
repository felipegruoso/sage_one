module Parsers

  #
  # This implementation aims to simplify the access
  # to error's message.
  #
  class Message

    UNEXPECTED_ERROR = 'An unexpected error has occurred while processing the file.'
    INVALID_TYPE     = 'The file is not for products.'
    INVALID_FILE     = 'The file format is invalid.'
    NO_FILE          = 'No file selected.'
    EMPTY_FILE       = 'The file is empty.'
    SUCCESS          = ' product(s) were imported.'
    IMPORT_ERROR     = 'Something went wrong while importing the products. ' +
                       'Please verify your imported file.'

    attr_reader :message, :success

    #
    # Creates the message.
    #
    # @param [String] message the message that will be returned to the user.
    # @param [Boolean] success if the message represents success or not.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def initialize(message = '', success = false)
      @message = message
      @success = success
    end

    #
    # Creates a message representing an unexpected error.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.unexpected_error
      self.new(UNEXPECTED_ERROR)
    end

    #
    # Creates a message representing that the file format is invalid.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.invalid_type
      self.new(INVALID_TYPE)
    end

    #
    # Creates a message representing that the file is invalid.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.invalid_file
      self.new(INVALID_FILE)
    end

    #
    # Creates a message representing that any file was selected.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.no_file
      self.new(NO_FILE)
    end

    #
    # Creates a message representing that the imported file is empty.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.empty_file
      self.new(EMPTY_FILE)
    end

    #
    # Creates a message representing success.
    #
    # @param [Fixnum] quantity the quantity of imported products.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.success(quantity)
      self.new(quantity.to_s + SUCCESS, true)
    end

    #
    # Creates a message representing an import error.
    #
    # @return [Parsers::Message] a message to be shown to the user.
    #
    def self.import_error
      self.new(IMPORT_ERROR)
    end

  end

end
