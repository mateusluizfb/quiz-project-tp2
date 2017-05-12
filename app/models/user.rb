class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email, :login, :password

  # has_and_belongs_to_many :teams
  # has_and_belongs_to_many :disciplines
end
