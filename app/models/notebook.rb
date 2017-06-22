class Notebook < ApplicationRecord
  validates_presence_of :user_id

  belongs_to :user
  has_and_belongs_to_many :disciplines
end
