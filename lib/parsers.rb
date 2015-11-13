module Parsers

  BLUE_BILL_FORMAT      = "application/vnd.ms-excel"
  YOU_DO_INVOICE_FORMAT = "text/plain"

  #
  # Parses the file according to its origin.
  #
  # @param [Array] an array containing the file lines.
  # @param [String] content_type the file format.
  #
  # @return [Parsers::Message] a message with the process result.
  #
  def self.parse_file(content, content_type)
    if content_type == BLUE_BILL_FORMAT
      parse_blue_bill(content)

    elsif content_type == YOU_DO_INVOICE_FORMAT
      parse_you_do_invoice(content)

    else
      Parsers::Message.invalid_file
    end
  end

  #
  # Parses an YouDoInvoice's file.
  #
  # @param [Array] an array containing the file lines.
  #
  # @return [Parsers::Message] a message with the process result.
  #
  def self.parse_you_do_invoice(content)
    Parsers::YouDoInvoice.parse(content)
  end

  #
  # Parses a BlueBill's file.
  #
  # @param [Array] an array containing the file lines.
  #
  # @return [Parsers::Message] a message with the process result.
  #
  def self.parse_blue_bill(content)
    Parsers::BlueBill.parse(content)
  end

end
