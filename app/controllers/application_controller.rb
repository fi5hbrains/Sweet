class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?, :sizes
 
  private
  
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def sizes
      sizes = Array.new
      (36..52).step(2).each do |i|
        sizes << "size#{i}"
      end
      return sizes
    end
    
    def size_collect(params)
      search = []
      sizes.each do |size|
        if params[:"#{size}"]
          search << size
        end
      end
      search
    end
    
  protected
  
    def authorize
      unless admin?
        redirect_to :login
        false
      end
    end
    
    def admin?
      session[:password] == 'SweetSize123'
    end
  
end
