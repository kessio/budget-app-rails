class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses

  validates :name, presence: true
  validates :icon, presence: true

  def latest_expenses
    expenses.order(created_at: :desc)
  end

  def total
    expenses.sum(:amount)
  end
end
