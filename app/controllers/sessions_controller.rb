class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      user = user.decorate
      # session[:user_id] = user.id - перенесено в sign_in, app/controllers/concerns/authentication.rb
      sign_in user
      flash[:success] = "Welcoe back, #{user.name_or_email} !"
      redirect_to root_path
    else
      # flash[:warning] = 'incorrect email or password' - warning не работает хоть тресни
      flash[:success] = 'incorrect email or password'
      redirect_to new_session_path, notice: 'Redirect'
    end
  end

  def destroy

  end
end
