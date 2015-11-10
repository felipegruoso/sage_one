module Parsers

  class BaseParser

    attr_reader :content

    DICTIONARY = {
      "Categoria"            => :category,
      "Unidade"              => :unity,
      "Descrição"            => :description,
      "Identificação"        => :identification,
      "Custo"                => :cost,
      "Preço de Venda 1"     => :selling_price,
      "Preço de Venda 2"     => :selling_price,
      "Preço de Venda 3"     => :selling_price,
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
      "Moeda"                => :coin,
    }

    def self.parse(content = nil)
      self.new(content).safe_parse
    end

    def initialize(content = nil)
      @content = content
    end

    def safe_parse
      handle_exception { parse }
    end

    def handle_exception(&block)
      yield

    # For now all errors should be classified as unexpected.
    rescue Exception => e
      puts e
      puts e.backtrace
      return Parsers::Error.unexpected_error
    end

    def parse
      raise NoMethodError.new('Override this method on children classes.')
    end

  end

end
