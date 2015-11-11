# encoding: utf-8

module Parsers

  class BaseParser

    attr_reader :content

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

    def self.parse(content)
      self.new(content).safe_parse
    end

    def initialize(content = [])
      @content = content
    end

    def safe_parse
      handle_exception { parse }
    end

    def handle_exception(&block)
      yield

    rescue TypeError
      return Parsers::Error.invalid_type
    rescue Exception
      return Parsers::Error.unexpected_error
    end

    def parse
      raise NoMethodError.new('Override this method on children classes.')
    end

    def decode_line(line)
      line.force_encoding('ISO-8859-1').encode('UTF-8')
    end

  end

end
