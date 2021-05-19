class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @categories
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @categories = Category.find(params[:id])
  end
end