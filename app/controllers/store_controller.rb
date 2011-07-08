class StoreController < ApplicationController
  before_filter :collections
  layout "store"

  def index
    @current_type = Type.find(params[:type]) if params[:type]
    @products = Product.filter(@search,params[:type]).paginate :page=>params[:page], :order=>'created_at desc', :per_page => 16
    respond_to do |format|
      format.html # index.html.erb
    end  
  end
  
  def show
    @product = Product.find(params[:id])
    @current_type = @product.type

    params[:type] = @current_type.id
    params[:slide] = 'front' unless params[:slide]

    images = @product.photos
    @front = images.find_by_view('front').photo
    @back = images.find_by_view('back').photo
    @detail = images.find_by_view('detail').photo

    @choice = Array.new
    sizes.each do |size|
      if @product[:"#{size}"] > 0
        @choice << size[4,5].to_i
      end
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  protected

  def collections
    @cart = current_cart
    @types = Type.all
    if params[:search]
      sizes.each do |size|
        session[:"#{size}"] = params[:"#{size}"]
      end
    end
    @search = size_collect(session)
  end
  
end
