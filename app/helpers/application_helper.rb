module ApplicationHelper

  def current_user
    @current_user = current_admin ? current_admin : current_client ? current_client : nil
  end
end
