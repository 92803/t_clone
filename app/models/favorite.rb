class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :coment

  validates :user_id,{presence: true}
  validates :coment_id,{presence: true}
end
