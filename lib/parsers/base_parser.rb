# encoding: utf-8

module Parsers

  class BaseParser

    attr_reader :content

    #
    # Maps the files headers with the model attributes.
    #
    DICTIONARY = {
      "Categoria"            => :categories,
      "Unidade"              => :unity,
      "Descrição"            => :description,
      "Identificação"        => :identification,
      "Custo"                => :cost,
      "Preço de Venda 1"     => :selling_values,
      "Preço de Venda 2"     => :selling_values,
      "Preço de Venda 3"     => :selling_values,
      "Observações"          => :observation,
      "Fornecedor"           => :provider,
      "Estoque"              => :stock,
      "Cód. Barra"           => :bar_code,
      "Estoque Mínimo"       => :min_stock,
      "Estoque Máximo"       => :max_stock,
      "Estoque Compra"       => :stock_purchase,
      "Fator unid. de venda" => :factor,
      "NCM"                  => :ncm,
      "Marca"                => :brand,
      "Peso"                 => :weight,
      "Tamanho"              => :size,
      "Inativo"              => :inactive,
      "Tipo"                 => :kind,
      "Composição"           => :composition,
      "Matéria Prima"        => :feedstock,
      "Material Expediente"  => :expedient_material,
      "Para Venda"           => :for_sale,
      "Moeda"                => :currency,
    }

    #
    # Parses the imported file content.
    #
    # @params [Array] content an array with the file lines.
    #
    # @return [Array] a list containing all products to be imported.
    # @return [Parsers::Message] if something goes wrong during the process.
    #
    def self.parse(content)
      return Parsers::Message.empty_file if content.size == 0
      self.new(content).safe_parse
    end

    #
    # Initializes the variables.
    #
    # @param [Array] content an array with the file lines.
    #
    def initialize(content = [])
      @content = content
    end

    #
    # Runs the parser handling exceptions.
    #
    # @return [Array] a list containing all products to be imported.
    # @return [Parsers::Message] if something goes wrong during the process.
    #
    def safe_parse
      handle_exception { parse }
    end

    #
    # Handles exceptions that can be raised during the execution.
    #
    # @return [Array] a list containing all products to be imported.
    # @return [Parsers::Message] if something goes wrong during the process.
    #
    def handle_exception(&block)
      yield

    rescue TypeError
      return Parsers::Message.invalid_type
    rescue Exception
      return Parsers::Message.unexpected_error
    end

    #
    # Raises an exception if the children class does not have this method.
    #
    # @raise [NoMethodError] raises an exception everytime.
    #
    def parse
      raise NoMethodError.new('Override this method on children classes.')
    end

    #
    # Decodes a string with special characters.
    #
    # @params [String] line a string from the imported file.
    #
    # @return [String] an UTF-8 decoded string.
    #
    def decode_line(line)
      line.to_s.force_encoding('ISO-8859-1').encode('UTF-8')
    end

  end

end
