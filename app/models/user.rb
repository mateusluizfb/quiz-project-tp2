class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email, :login, :password

  has_and_belongs_to_many :teams
  has_and_belongs_to_many :disciplines
end
