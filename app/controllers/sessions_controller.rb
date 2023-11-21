class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

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
      # урок 10: меняем  redirect_to на render, потому что с redirect_to params теряются, а с render - нет
      # params нам понадобятся для галочки remember_me
      # flash[:warning] = 'incorrect email or password'
      # redirect_to new_session_path
      flash.now[:warning] = 'incorrect email or password'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "See you later"
    redirect_to root_path
  end
end
