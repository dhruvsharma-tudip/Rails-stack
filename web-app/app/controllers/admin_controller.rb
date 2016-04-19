class AdminController < ApplicationController
  def index
    @users = User.get_all_users
  end

  def admin_create_new_user
    @role = Role.all.order(:name)
    @user = current_user
  end

  def admin_create_user
    @user = User.new(user_params)
    @user.skip_password_validation = true
    @user.skip_confirmation!
    if @user.save
      User.new.set_role_by_admin(user_params[:name].to_i, @user.id)
      response = UserMailer.set_password(@user).deliver
      redirect_to controller: 'dashboard', action: 'dashboard_admin'
    else
      @role = Role.all.order(:name)
      render 'admin_create_new_user'
    end
  end

  def set_user_password
    user_data = User.find(params[:user_id].to_i)
    byebug
    if user_data.update(password: params[:admin][:pwd], confirmed_at: Time.new.strftime('%Y-%m-%d %H:%M:%S'))
      flash[:notice]= 'Password changed successfully.'
      redirect_to new_user_session_path
    else
      flash[:notice]='Password is not set yet'
      render(:back)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :name)
  end
end
