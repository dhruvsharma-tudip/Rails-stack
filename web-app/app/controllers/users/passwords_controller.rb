class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  #  def new
  #   super
  #  end

  # POST /resource/password
  #  def create
  #   super
  #  end

  # GET /resource/password/edit?reset_password_token=abcdef
  #  def edit
  # #   super
  #  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message)
      redirect_to new_user_session_path
    else
      respond_with resource
    end
  end
  # protected
  #
  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end
  #
  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
