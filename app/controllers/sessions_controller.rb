class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
    skip_before_filter :verify_authenticity_token



  def new
  end




  def create
      if @user = login(params[:email], params[:password], params[:remember_me]) and @user.activation_state != "pending"
      flash[:success] = "Bienvenido, #{@user.first_name}!"
      redirect_to root_path
      
    else
      flash.now[:danger] = "¡Error de inicio de sesion! Por favor, consultar su correo electrónico y contraseña."
      logout
    redirect_to root_path
    end
  end

  def destroy
    logout
    flash[:success] = "Cerraste la sesión."
    redirect_to root_path
  end
end
