class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email, :login, :password

  has_one :notebook

  has_and_belongs_to_many :teams
  has_and_belongs_to_many :disciplines

  after_create :create_notebook

  def create_notebook
    Notebook.create(user: self)
  end
end
