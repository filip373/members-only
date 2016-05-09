class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:notice] = 'User logged in'
      redirect_to sign_in_path
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'User logged out'
    redirect_to sign_in_path
  end
end
