class Addendum < ApplicationRecord
  belongs_to :user # Wrote the comment
  belongs_to :commentable, polymorphic: true # Left the comment on

  def allowed_to_destroy?(this_user)
    commentable == this_user || user == this_user || this_user.admin?
  end

end
