class Ability
  include CanCan::Ability

  def initialize(current_user)
    return unless current_user.present?

    can :manage, Category, user: current_user
    can :manage, Expense, user: current_user
    can :manage, CategoryExpense do |category_expense|
      category_expense.category.user == current_user
    end
  end
end
