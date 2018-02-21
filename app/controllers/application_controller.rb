class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token , if: :is_json_api?

  protected

  # API support:
  def is_json_api?
    params[:controller].start_with?('api')
  end

end
