class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com',
  return_path: 'no-reply@jungle.com'
  
  ########Send an email to the user if the order is valid with the order details
  def new_order_email(order)
    @order = order
    @line_items = LineItem.where(order: @order.id)
    mail(to: @order.email , subject: "Order ID: #{@order.id}!")
  end

end
