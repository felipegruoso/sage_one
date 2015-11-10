module Parsers

  def self.parse_file(args = {})
  end

  def self.parse_you_do_invoice(args = {})
    Parsers::YouDoInvoice.new(args).parse
  end

  def self.parse_blue_bill(args = {})
    Parsers::BlueBill.new(args).parse
  end

end
