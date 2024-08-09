class Breed < ApplicationRecord
  belongs_to :group
  has_many :images, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :group, presence: true
end
