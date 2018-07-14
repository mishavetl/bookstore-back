class CategoriesController < ApplicationController
  clear_respond_to
  respond_to :json

  def index
    render json: Category.all.as_json
  end
end
