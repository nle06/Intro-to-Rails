class Image < ApplicationRecord
  belongs_to :breed
  validates :url, presence: true, format: { with: URI::regexp(%w[http https]) }
  validates :breed, presence: true
end
