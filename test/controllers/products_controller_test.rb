require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { bar_code: @product.bar_code, brand: @product.brand, code: @product.code, composition: @product.composition, cost: @product.cost, currency: @product.currency, description: @product.description, expedient_material: @product.expedient_material, factor: @product.factor, feedstock: @product.feedstock, for_sale: @product.for_sale, gender: @product.gender, identification: @product.identification, inactive: @product.inactive, ipi: @product.ipi, max_stock: @product.max_stock, min_stock: @product.min_stock, ncm: @product.ncm, observation: @product.observation, provider: @product.provider, size: @product.size, stock: @product.stock, stock_purchase: @product.stock_purchase, type: @product.type, unity: @product.unity, weight: @product.weight }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { bar_code: @product.bar_code, brand: @product.brand, code: @product.code, composition: @product.composition, cost: @product.cost, currency: @product.currency, description: @product.description, expedient_material: @product.expedient_material, factor: @product.factor, feedstock: @product.feedstock, for_sale: @product.for_sale, gender: @product.gender, identification: @product.identification, inactive: @product.inactive, ipi: @product.ipi, max_stock: @product.max_stock, min_stock: @product.min_stock, ncm: @product.ncm, observation: @product.observation, provider: @product.provider, size: @product.size, stock: @product.stock, stock_purchase: @product.stock_purchase, type: @product.type, unity: @product.unity, weight: @product.weight }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
