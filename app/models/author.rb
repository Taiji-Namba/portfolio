class Author < ApplicationRecord
  has_many :author_favorites, dependent: :destroy
  accepts_nested_attributes_for :author_favorites
  validates :author_name, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}

  def self.registered(book)
    find_or_initialize_by(author_name: book.author.gsub(" ","").gsub("　",""))
  end
  
end