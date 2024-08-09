class Group < ApplicationRecord
  has_many :breeds
  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 500 }
end
