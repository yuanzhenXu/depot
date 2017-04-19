class SessionController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:name],params[:password])
      session[:user_id] = user.id
      redirect_to admin_index_url
    else
      redirect_to login_url, :alert => 'INvalid user/password combination'
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to store_url, :notice => "logged out"
  end
end
