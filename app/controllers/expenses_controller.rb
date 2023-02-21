class ExpensesController < ApplicationController
  before_action :set__category, only: %i[index new edit create update destroy]
  before_action :set_expense, only: %i[edit update destroy]

  def index
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author = current_user

    if @expense.save
      @category_expense = CategoryExpense.create(category: @category, epxense: @expense)
      flash[:notice] = 'Expense was created successfully'
      redirect_to category_expenses_path(@category)
    else
      flash[:notice] = 'Expense was not created'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      flash[:notice] = 'Expense was updated successfully'
      redirect_to category_expenses_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy
    flash[:notice] = 'Expense was deleted successfully'
    redirect_to category_expenses_path(@category)
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
