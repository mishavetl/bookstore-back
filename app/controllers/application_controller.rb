class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_locale
  before_action :add_allow_credentials_headers
  before_action :cors_preflight_check

  after_action :cors_set_access_control_headers

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def cors_set_access_control_headers
    add_allow_access_control_headers
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      add_allow_access_control_headers
      render :text => '', :content_type => 'text/plain'
    end
  end

  def add_allow_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    # headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    headers['Access-Control-Expose-Headers'] = 'access-token, token-type, uid, client, expiry'
  end

  def add_allow_credentials_headers
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#section_5
    #
    # Because we want our front-end to send cookies to allow the API to be authenticated
    # (using 'withCredentials' in the XMLHttpRequest), we need to add some headers so
    # the browser will not reject the response
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
end
