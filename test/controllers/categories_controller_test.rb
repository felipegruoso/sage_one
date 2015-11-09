require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @product  = products(:one)
    @category = categories(:one)
  end

  test "should get new" do
    get :new, product_id: @product.id
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { description: @category.description }, product_id: @product.id
    end

    assert_redirected_to product_categories_path(@product.id)
  end

  test "should show category" do
    get :show, id: @category.id, product_id: @product.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category.id, product_id: @product.id
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category.id, category: { description: @category.description }, product_id: @product.id
    assert_redirected_to product_categories_path(@product.id)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category.id, product_id: @product.id
    end

    assert_redirected_to product_categories_path(@product.id)
  end
end
