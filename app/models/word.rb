class Word < ApplicationRecord
  # アソシエーション
  belongs_to :user
  # バリデーション
  validates :keyword, presence: true
  validates :content_url, presence: true
end
