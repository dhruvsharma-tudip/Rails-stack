class Users::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  # This action will allow to redirect to different page as current_user's role after sign in
  def sign_in_and_redirect(resource_or_scope, resource = nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    after_sign_in_path_for(user)
  end

  protected

  def after_sign_in_path_for(_user)
    if current_user.is_admin?
      dashboard_admin_path
    elsif current_user.is_prospect?
      dashboard_home_path
    end
  end
end
