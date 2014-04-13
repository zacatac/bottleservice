class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  @@this_week = [1,2]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @products = []
    @@this_week.each_with_index do |id,index|
      puts "ID:#{id}"
      @products[index] = Product.find(id)
     end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    puts "ORDERPARAMS"
    @order = Order.new(order_params)
    puts "ORDER"
    puts "#{@order}"
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }        
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    if @order.member.nil? 
        redirect_to new_member_registration_path
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cheap_beer, :class_beer, :member)
    end
end
