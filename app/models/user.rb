class User < ApplicationRecord
  has_secure_password

  validates :username, :email, uniqueness: true, presence: true

  has_many :posts
  has_many :thumbs

  has_many :written_addendums, class_name: Addendum
  has_many :addendums, as: :commentable

  def admin?
    role == "admin"
  end

end
