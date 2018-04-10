class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:dashboard, :calendar]
  protect_from_forgery with: :exception

  # GET /
  def home
  end

  # GET /dashboard
  def dashboard
  end

  # GET /calendar
  def calendar
  end

end
