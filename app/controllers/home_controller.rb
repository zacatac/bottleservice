class HomeController < ApplicationController


  # GET /products
  # GET /products.json
  def index
    
  end

  def update_quantities(params)
    order = Order.find(params[:id])
    order.update_quantity #call your method on the model to update the username
    redirect_to :back #or whatever you'd like it to redirect to
  end
  helper_method :update_quantities

end
