class AuthorFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :author
  validates :user_id, uniqueness: {
    scope: :author_id,
    message: "はすでにお気に入り登録されています"
  }
  has_many :register_books, dependent: :destroy
  has_many :registered_books, through: :register_books, source: :favored_author_book

  def self.favored(author, user)
    find_by(author_id: author.id, user_id: user.id)
  end

end