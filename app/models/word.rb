class Word < ApplicationRecord
  validates :keyword, presence: true
  validates :content_url, presence: true
end
