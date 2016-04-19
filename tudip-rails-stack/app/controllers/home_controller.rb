class HomeController < ApplicationController
  before_action :authenticate_user!, only: [ :admin_dashboard, :member_dashboard ]

  def index
  end

  def admin_dashboard
  end

  def member_dashboard
  end
end
