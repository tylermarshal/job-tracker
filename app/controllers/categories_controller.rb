class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if category.save
      flash[:success] = "#{@category.name} added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
