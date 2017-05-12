class Discipline < ApplicationRecord
  has_many :topics
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :topics, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :name
end
