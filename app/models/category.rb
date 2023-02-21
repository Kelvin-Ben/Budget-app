class Category < ApplicationRecord
  self.table_name = 'categories'
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :author, message: 'You have a category with this item' }
  validates :icon, presence: true
end
