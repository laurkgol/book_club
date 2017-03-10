class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Good job abstracting user authentication to the application
  # controller using before_action
  protect_from_forgery with: :exception
end
