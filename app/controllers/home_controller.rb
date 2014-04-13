class HomeController < ApplicationController
  @@this_week = [1,2]

  # GET /products
  # GET /products.json
  def index
    @products = []
    @@this_week.each_with_index do |id,index|
      puts "ID:#{id}"
      @products[index] = Product.find(id)
     end
    @class_beer = 0
    @cheap_beer = 0
  end

  def update_quantities(params)
    order = Order.find(params[:id])
    order.update_quantity #call your method on the model to update the username
    redirect_to :back #or whatever you'd like it to redirect to
  end
  helper_method :update_quantities
  
  def action 
    @order = Order(params[:quantity0],
                   :cheap_beer => params[:quantity1])
    render :viewname, :layout => false
  end

end
