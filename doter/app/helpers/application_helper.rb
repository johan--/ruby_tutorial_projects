module ApplicationHelper
  def page_header(text)
    content_for(:page_header) { text.to_s.html_safe }
  end

  private

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
