class UsersController < ApplicationController
  def agree
    render 'users/registrations/agreement'
  end

  def resource
    @user || User.new
  end
  helper_method :resource

  # This action will allow to edit Users Profile
  def edit_profile
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'Account_updated'
      redirect_to dashboard_home_path
    else
      render 'users/registrations/edit'
    end
  end

  # This action will allow to change user password
  # def change_password
  # end


  def update_password
    @user = current_user

    if @user.valid_password?(params[:user][:current_password])
      if params[:user][:password] == params[:user][:current_password]
        flash[:notice] = 'Current Password and New Password should not be same.'
        redirect_to(:back)
      elsif @user.update!(user_params)
        flash[:success] = 'Password updated successfully, please login with the new password.'
        redirect_to new_user_session_path
      end
    else
      flash[:notice] = 'Please enter valid current password.'
      redirect_to(:back)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :avatar, profile_attributes: [:dob, :phonenumber, :rentvsbuyvsunknown, :whenlookkingfor, :noofbeds, :noofbathrooms, :budget, :noofchildren, :agechild, :decision1, :decision2, :workaddress])
  end
end
