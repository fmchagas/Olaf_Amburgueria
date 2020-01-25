require "application_system_test_case"

class TipeProductsTest < ApplicationSystemTestCase
  setup do
    @tipe_product = tipe_products(:one)
  end

  test "visiting the index" do
    visit tipe_products_url
    assert_selector "h1", text: "Tipe Products"
  end

  test "creating a Tipe product" do
    visit tipe_products_url
    click_on "New Tipe Product"

    fill_in "Name", with: @tipe_product.name
    click_on "Create Tipe product"

    assert_text "Tipe product was successfully created"
    click_on "Back"
  end

  test "updating a Tipe product" do
    visit tipe_products_url
    click_on "Edit", match: :first

    fill_in "Name", with: @tipe_product.name
    click_on "Update Tipe product"

    assert_text "Tipe product was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipe product" do
    visit tipe_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipe product was successfully destroyed"
  end
end
