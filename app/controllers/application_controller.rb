class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user = current_admin ? current_admin : current_client ? current_client : nil
  end
end
