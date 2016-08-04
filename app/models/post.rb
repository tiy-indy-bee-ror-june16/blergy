class Post < ApplicationRecord
  belongs_to :user
  has_many :thumbs
  has_many :addendums, as: :commentable

  validates :title, :body, presence: true

end
