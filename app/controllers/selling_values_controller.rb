class SellingValuesController < ApplicationController
  before_action :set_selling_value, only: [:show, :edit, :update, :destroy]

  # GET /selling_values
  # GET /selling_values.json
  def index
    @selling_values = SellingValue.all
  end

  # GET /selling_values/1
  # GET /selling_values/1.json
  def show
  end

  # GET /selling_values/new
  def new
    @selling_value = SellingValue.new
  end

  # GET /selling_values/1/edit
  def edit
  end

  # POST /selling_values
  # POST /selling_values.json
  def create
    @selling_value = SellingValue.new(selling_value_params)

    respond_to do |format|
      if @selling_value.save
        format.html { redirect_to @selling_value, notice: 'Selling value was successfully created.' }
        format.json { render :show, status: :created, location: @selling_value }
      else
        format.html { render :new }
        format.json { render json: @selling_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selling_values/1
  # PATCH/PUT /selling_values/1.json
  def update
    respond_to do |format|
      if @selling_value.update(selling_value_params)
        format.html { redirect_to @selling_value, notice: 'Selling value was successfully updated.' }
        format.json { render :show, status: :ok, location: @selling_value }
      else
        format.html { render :edit }
        format.json { render json: @selling_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selling_values/1
  # DELETE /selling_values/1.json
  def destroy
    @selling_value.destroy
    respond_to do |format|
      format.html { redirect_to selling_values_url, notice: 'Selling value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selling_value
      @selling_value = SellingValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selling_value_params
      params.require(:selling_value).permit(:value, :product_id)
    end
end
