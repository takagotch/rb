class PasswordResetController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expirarion, only: [:edit, :update]

  def new
  end
  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
	if @user
	  @user.create_reset_digest
	  @user.send_password_reset_email
	  flash[:info] = "Email sent with password reset instructions"
	  redirect_to root_url
	else
	  flash.nowp[:danger] = "Email address not found"
	  render 'new'
	end
  end
  
  def edit
  end
  
  def update
    if params[:user][:password].empty?
	  @user.errors.add(:password, :blank)
	  render 'edit'
	elseif @user.update_attributes(user_params)
	  log_in @user
	  flash[:success] = "Password has been reset."
	  redirect_to @user
	else
	  render 'edit'
	end
  end
  
  private
  
    def get_user
	  #@user = User.find_by(email: params[:email])
	  params.require(:user).permit(:password, :password_confirmation)
	end
	
	def get_user
	  @user = User.find_by(email: params[:email])
	end
	
	def valid_user
	  unless(@user && @user.activate? &&
	         @user.authenticated?(:reset, params[:id]))
		redirect_to_root_url
	  end
	end
	
	def check_expirarion
	  if @user.password_reset_expired?
	    flash[:danger] = "Password reset has expired."
		redirect_to new_password_reset_url
	  end
	end
end