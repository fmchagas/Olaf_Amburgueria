module HomeHelper
  
  def shop_cart?(id)
    return false if cookies[:cart].blank?

    products = JSON.parse(cookies[:cart])
    products.include?(id.to_s)
  end
  
end
