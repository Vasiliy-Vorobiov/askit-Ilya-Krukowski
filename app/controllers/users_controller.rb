class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      # session[:user_id] = @user.id - перенесено в sign_in, app/controllers/concerns/authentication.rb
      sign_in @user
      @user = @user.decorate
      flash[:success] = "User #{@user.name_or_email} created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
