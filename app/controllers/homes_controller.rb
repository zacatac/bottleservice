class HomeController < ApplicationController
  @@this_week = [1,2]

  # GET /products
  # GET /products.json
  def index
    @products = []
    @@this_week.each_with_index do |id,index|
      puts "#{id}"
      @products[index] = Product.find(id)
    end
    if member_signed_in?
      @order = Order.create(:member => @current_member,
                          :cheap_beer => @count_cheap,
                          :class_beer => @count_class)
    else
      @order = Order.create(:cheap_beer => @count_cheap,
                            :class_beer => @count_class)
    end
  end

  def add_class    
    order = Order.find(params[:id])
    order.update_attribute(:class_beer, order.class_beer + 1)
  end
end
