class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def create_dependents(args = {})
    categories     = JSON.parse(args[:categories])
    selling_values = JSON.parse(args[:selling_values])

    @product.categories.destroy_all
    @product.categories = categories.map do |category|
      Category.new({ description: category })
    end

    @product.selling_values.destroy_all
    @product.selling_values = selling_values.map do |selling_value|
      SellingValue.new({ value: selling_value })
    end
  end
  alias :update_dependents :create_dependents

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      create_dependents(params[:product])
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      update_dependents(params[:product])
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /products/import
  def import
  end

  # POST /products/upload
  def upload
    if params[:file].blank?
      response = Parsers::Message.no_file
    else
      content      = params[:file].tempfile.readlines
      content_type = params[:file].content_type

      response = Importer.import_products(content, content_type)
    end

    respond_to do |format|
      resp = {
        message: response.message,
        success: response.success
      }

      format.json { render json: resp }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:unity, :description, :identification, :cost, :observation, :provider, :stock, :bar_code, :min_stock, :max_stock, :stock_purchase, :factor, :ncm, :brand, :weight, :size, :inactive, :kind, :composition, :feedstock, :expedient_material, :for_sale, :currency, :code, :ipi, :gender)
    end
end
