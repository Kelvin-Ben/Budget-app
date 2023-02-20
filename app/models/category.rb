class Category < ApplicationRecord
  self.table_name = 'categories'
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses, dependent: :destroy

  validates :name, :icon, presence: true
end
