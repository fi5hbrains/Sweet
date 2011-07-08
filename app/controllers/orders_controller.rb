class OrdersController < ApplicationController
    layout "order"

  def index
    @orders = Order.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, :notice => 'Ваша карзина пуста.'
      return
    end
    @order = Order.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @cart = current_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to(store_url, :notice => 'Спасибо! Ваш заказ принят.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    if params[:commit] == 'Применить'
      if params[:order][:processed] == '1'
        @order.remove
      else
        @order.put_back
      end
    end
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(types_path(:order => 'all'))}
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.put_back if @order.processed
    @order.destroy
    respond_to do |format|
      format.html { redirect_to(types_path( :order => 'all')) }
    end
  end
  
end
