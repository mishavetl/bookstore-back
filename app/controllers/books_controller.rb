class BooksController < ApplicationController
  clear_respond_to
  respond_to :json

  def index
    render json: current_user.as_json
  end
end
