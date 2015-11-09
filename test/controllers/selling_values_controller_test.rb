require 'test_helper'

class SellingValuesControllerTest < ActionController::TestCase
  setup do
    @selling_value = selling_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selling_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selling_value" do
    assert_difference('SellingValue.count') do
      post :create, selling_value: { product_id: @selling_value.product_id, value: @selling_value.value }
    end

    assert_redirected_to selling_value_path(assigns(:selling_value))
  end

  test "should show selling_value" do
    get :show, id: @selling_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selling_value
    assert_response :success
  end

  test "should update selling_value" do
    patch :update, id: @selling_value, selling_value: { product_id: @selling_value.product_id, value: @selling_value.value }
    assert_redirected_to selling_value_path(assigns(:selling_value))
  end

  test "should destroy selling_value" do
    assert_difference('SellingValue.count', -1) do
      delete :destroy, id: @selling_value
    end

    assert_redirected_to selling_values_path
  end
end
