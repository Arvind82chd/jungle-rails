class Admin::CategoriesController < ApplicationController

  USER_ID, PASSWORD = 'Jungle', 'book'
  # Require authentication only 
  before_filter :authenticate, :only => [ :index, :new ]
  
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  # def destroy
  #   @category = Category.find params[:id]
  #   @category.destroy
  #   redirect_to [:admin, :categories], notice: 'category deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :category_id,
    )
  end

  private
  def authenticate
     authenticate_or_request_with_http_basic do |id, password| 
        id == USER_ID && password == PASSWORD
     end
  end
end
