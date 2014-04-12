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
  end
end
