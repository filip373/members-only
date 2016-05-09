module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end

  def logged_in?
    !current_user.nil?
  end
end
