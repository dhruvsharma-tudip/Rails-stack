class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  # This action will check whether profile in blank if blank then it will build profile
  # GET /resource/edit
  def edit
    @user.build_profile if @user.profile.blank?
  end

  # In rails application we have to allow each variable from the form.
  # This is for strong parameters purpose.
  # With Devise integration, we are allowing strong params while creating and updating the information.
  # Because it has the database connection
  # In following method we are permitting the form fields of registration form
  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Account_updated'
      redirect_to dashboard_home_path
    else
      render 'users/registrations/edit'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :avatar, profile_attributes: [:id, :dob, :phonenumber, :rentvsbuyvsunknown, :whenlookkingfor, :noofbeds, :noofbathrooms, :budget, :noofchildren, :agechild, :decision1, :decision2, :workaddress])
  end

  # This action will give permission to the following parameters to the configure in Database
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
  end

  def after_inactive_sign_up_path_for(resource)
    User.new.set_prospect_role_at_sign_up

    new_user_session_path
  end
end
