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

  def customer_logged?
    return false if cookies[:customer_login].blank?

    c = JSON.parse(cookies[:customer_login])
    Customer.where(id: c["id"]).count > 0
  end

  def customer
    c = JSON.parse(cookies[:customer_login])
    Customer.find(c["id"])
  end
end
