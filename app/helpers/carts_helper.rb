module CartsHelper
  def empty?
    cart.size < 1  
  end
end