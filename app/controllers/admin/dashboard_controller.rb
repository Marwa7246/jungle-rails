class Admin::DashboardController < Admin::BaseController

  # Show only the number of categories and number of products in each one  

  def show
    @num_products = Product.count
    @num_categories = Category.count
  end
end
