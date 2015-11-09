require 'test_helper'

class SellingValuesControllerTest < ActionController::TestCase
  setup do
    @product       = products(:one)
    @selling_value = selling_values(:one)
  end

  test "should get new" do
    get :new, product_id: @product.id
    assert_response :success
  end

  test "should create selling_value" do
    assert_difference('SellingValue.count') do
      post :create, selling_value: { value: @selling_value.value }, product_id: @product.id
    end

    assert_redirected_to product_selling_values_path(@product.id)
  end

  test "should show selling_value" do
    get :show, id: @selling_value.id, product_id: @product.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selling_value.id, product_id: @product.id
    assert_response :success
  end

  test "should update selling_value" do
    patch :update, id: @selling_value.id, selling_value: { value: @selling_value.value }, product_id: @product.id
    assert_redirected_to product_selling_values_path(@product.id)
  end

  test "should destroy selling_value" do
    assert_difference('SellingValue.count', -1) do
      delete :destroy, id: @selling_value, product_id: @product.id
    end

    assert_redirected_to product_selling_values_path(@product.id)
  end
end
