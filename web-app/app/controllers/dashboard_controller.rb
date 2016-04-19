class DashboardController < ApplicationController
  def dashboard_home
    @user = current_user
  end

  def show
  end

  # This action will be used in admin's dashboard.
  def dashboard_admin
    @user = current_user
    @users = User.all
    @grid = AdminsGrid.new(params[:admins_grid]) do |scope|
      scope.page(params[:page]).per(10)
    end
    @index_path = request.path
  end

  # This action will allow to change user password
  def change_password
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
  end

  private

  def grid_class
    @@grid_class ||= self.class::Grid
  end

  def grid_params
    params[grid_class.name.underscore.tr('/', '_')]
  end
end
