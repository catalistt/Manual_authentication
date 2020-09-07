class SessionsController < ApplicationController
	def new
		if logged?
      redirect_to root_path, notice: "You are already logged!"
    else
      @user = User.new  
    end
	end

	def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully logged"
    else
      flash[:notice] = 'Login failed.'
      render :new
    end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Sesión cerrada"
	end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end