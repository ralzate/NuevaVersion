class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:home, :contact, :help]
  def home
    @products = Product.search(params[:search]).page(params[:page]).per_page(9)
    @users = User.search(params[:search]).page(params[:page]).per_page(9)
    @type_products = TypeProduct.search(params[:search]).page(params[:page]).per_page(9)
    @user = User.new

    @products = @products.where("unit_price >= ?", params["min_price"]) if params["min_price"].present?
    @products = @products.where("unit_price <= ?", params["max_price"]) if params["max_price"].present?
    @products = @products.where(type_product_id: params["bedrooms"]) if params["bedrooms"].present?

  end
  def treeview
  end
  def contact
  end
  def help
  end
  def nosotros
  end
  
  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      flash[:success] = "Bienvenido, #{@user.first_name}!"
      redirect_to root_path
    else
      flash.now[:danger] = "¡Error de inicio de sesion! Por favor, consultar su correo electrónico y contraseña."
      render 'new'
    end
  end
end