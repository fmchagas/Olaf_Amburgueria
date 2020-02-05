module EcomerceHelper
  def shop_cart?(id)
    return false if cookies[:cart].blank?

    products = JSON.parse(cookies[:cart])
    products.include?(id.to_s)
  end

  def quantity_cart
    return 0 if cookies[:cart].blank?

    JSON.parse(cookies[:cart]).length
  end
end
