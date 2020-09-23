class OrderMailer < ApplicationMailer
  def new_order_email(order)
    @order = order
    @line_items = LineItem.where(order: @order.id)
    mail(to: @order.email , subject: "Order ID: #{@order.id}!")
  end

end
