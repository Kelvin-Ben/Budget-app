class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user

    if @category.save
      flash[:notice] = 'Category was created successfully'
      redirect_to categories_path
    else
      render :new, status: :uprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was updated successfully'
      redirect_to categories_path
    else
      render :edit, status: :uprocessable_entity
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Categories was deleted successfully'
    redirect_to categories_path
  end

  private

  def set__category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
