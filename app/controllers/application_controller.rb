class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    end
end
