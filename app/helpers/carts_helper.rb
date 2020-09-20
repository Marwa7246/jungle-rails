module CartsHelper
  def empty?
    cart.size < 1  
  end

  def order_description
    if current_user
      return "#{current_user.first_name} #{current_user.first_name}'s Jungle Order"
    else
      " Jungle Order"    
    end
  end

  def order_email
    if current_user
      return "#{current_user.email}"
    else
      " "
    end
  end

end
