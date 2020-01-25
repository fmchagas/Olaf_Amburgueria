require 'test_helper'

class TipeProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipe_product = tipe_products(:one)
  end

  test "should get index" do
    get tipe_products_url
    assert_response :success
  end

  test "should get new" do
    get new_tipe_product_url
    assert_response :success
  end

  test "should create tipe_product" do
    assert_difference('TipeProduct.count') do
      post tipe_products_url, params: { tipe_product: { name: @tipe_product.name } }
    end

    assert_redirected_to tipe_product_url(TipeProduct.last)
  end

  test "should show tipe_product" do
    get tipe_product_url(@tipe_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipe_product_url(@tipe_product)
    assert_response :success
  end

  test "should update tipe_product" do
    patch tipe_product_url(@tipe_product), params: { tipe_product: { name: @tipe_product.name } }
    assert_redirected_to tipe_product_url(@tipe_product)
  end

  test "should destroy tipe_product" do
    assert_difference('TipeProduct.count', -1) do
      delete tipe_product_url(@tipe_product)
    end

    assert_redirected_to tipe_products_url
  end
end
