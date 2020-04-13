class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :authenticate_user!
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  def authorize_class(klass)
    authorize klass
  end
end
