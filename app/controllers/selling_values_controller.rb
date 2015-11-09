class SellingValuesController < ApplicationController
  before_action :set_selling_value, only: [:show, :edit, :update, :destroy]

  # GET /products/:product_id/selling_values
  # GET /products/:product_id/selling_values.json
  def index
    @product        = Product.find(params[:product_id])
    @selling_values = @product.selling_values
  end

  # GET /products/:product_id/selling_values/1
  # GET /products/:product_id/selling_values/1.json
  def show
    @selling_value = SellingValue.find(params[:id])
  end

  # GET /products/:product_id/selling_values/new
  def new
    @product       = Product.find(params[:product_id])
    @selling_value = @product.selling_values.new
  end

  # GET /products/:product_id/selling_values/1/edit
  def edit
    @selling_value = SellingValue.find(params[:id])
  end

  # POST /products/:product_id/selling_values
  # POST /products/:product_id/selling_values.json
  def create
    @selling_value = SellingValue.new(selling_value_params)

    respond_to do |format|
      if @selling_value.save
        format.html { redirect_to product_selling_values_path(params[:product_id]), notice: 'Selling value was successfully created.' }
        format.json { render :show, status: :created, location: @selling_value }
      else
        format.html { render :new }
        format.json { render json: @selling_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/:product_id/selling_values/1
  # PATCH/PUT /products/:product_id/selling_values/1.json
  def update
    @selling_value = SellingValue.find(params[:id])
    respond_to do |format|
      if @selling_value.update(selling_value_params)
        format.html { redirect_to product_selling_values_path(params[:product_id]), notice: 'Selling value was successfully updated.' }
        format.json { render :show, status: :ok, location: @selling_value }
      else
        format.html { render :edit }
        format.json { render json: @selling_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/:product_id/selling_values/1
  # DELETE /products/:product_id/selling_values/1.json
  def destroy
    @selling_value = SellingValue.find(params[:id])
    @selling_value.destroy
    respond_to do |format|
      format.html { redirect_to product_selling_values_path(params[:product_id]), notice: 'Selling value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selling_value
      @product        = Product.find(params[:product_id])
      @selling_values = @product.selling_values
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selling_value_params
      params.require(:selling_value).permit(:value, :product_id)
    end
end
