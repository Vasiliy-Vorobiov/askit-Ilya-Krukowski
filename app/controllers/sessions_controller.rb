class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      user = user.decorate
      # session[:user_id] = user.id - перенесено в sign_in, app/controllers/concerns/authentication.rb
      sign_in user
      flash[:success] = "Welcome back, #{user.name_or_email} !"
      redirect_to root_path
    else
      # flash[:warning] = 'incorrect email or password' - warning не работает хоть тресни
      flash[:warning] = 'incorrect email or password'
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    flash[:success] = "See you later"
    redirect_to root_path
  end
end
