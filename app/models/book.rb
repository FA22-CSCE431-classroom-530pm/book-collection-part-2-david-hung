class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books

  validates :title, :author, :price, :published_date, presence: true
end
