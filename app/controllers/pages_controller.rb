class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:home, :contact, :help]
  def home
    @products = Product.search(params[:search]).page(params[:page]).per_page(3)
    @users = User.search(params[:search]).page(params[:page]).per_page(3)
    @user = User.new
  end
  def treeview
  end
  def contact
  end
  def help
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