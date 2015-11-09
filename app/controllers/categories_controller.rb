class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /products/:product_id/categories
  # GET /products/:product_id/categories.json
  def index
    @product    = Product.find(params[:product_id])
    @categories = @product.categories
  end

  # GET /products/:product_id/categories/1
  # GET /products/:product_id/categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /products/:product_id/categories/new
  def new
    @product  = Product.find(params[:product_id])
    @category = @product.categories.new
  end

  # GET /products/:product_id/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /products/:product_id/categories
  # POST /products/:product_id/categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to product_categories_path(params[:product_id]), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/:product_id/categories/1
  # PATCH/PUT /products/:product_id/categories/1.json
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to product_categories_path(params[:product_id]), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/:product_id/categories/1
  # DELETE /products/:product_id/categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to product_categories_path(params[:product_id]), notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @product    = Product.find(params[:product_id])
      @categories = @product.categories
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:description, :product_id)
    end
end
