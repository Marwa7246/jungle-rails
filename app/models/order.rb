class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

###########Decrease the quantity of product inventory after putting an order
  after_create do
    @line_items = LineItem.where(order: self.id)
    @line_items.map do |line_item|
      @product=Product.find(line_item.product_id)
      @quantity = line_item.quantity
      @product.quantity -= @quantity
      @product.save!
    end
    #byebug
        
  end

end
