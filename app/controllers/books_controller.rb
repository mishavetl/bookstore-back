class BooksController < ApplicationController
  clear_respond_to
  respond_to :json

  # before_action create, :authenticate_admin!

  def index
    render json: Book.all.as_json
  end

  # def create
  #
  # end

  def show
    render json: Book.find.as_json
  end
end
