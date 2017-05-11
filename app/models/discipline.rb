class Discipline < ApplicationRecord
  has_many :topics
  has_and_belongs_to_many :users
end
