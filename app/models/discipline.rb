class Discipline < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_and_belongs_to_many :users
  has_and_belongs_to_many :notebooks
  accepts_nested_attributes_for :topics, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :name
end
