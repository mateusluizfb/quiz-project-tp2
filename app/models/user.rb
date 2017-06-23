##
# Esta classe representa a entidade usuário, que possui um caderno
# e pode possuir um ou mais times
class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  ##
  # Nome obrigatório
  validates :name, presence: true

  ##
  # Email obrigatório
  validates :email, presence: true

  ##
  # Login obrigatório
  validates :login, presence: true

  ##
  # Senha obrigatória
  validates :password, presence: true

  ##
  # Este método estabelece o relacionamento 1-1 com caderno
  has_one :notebook

  ##
  # Este método estabelece o relacionamento N-N com equipes
  has_and_belongs_to_many :teams

  after_create :create_notebook

  ##
  # Este método cria um caderno para o usuário
  # após a sua criação
  def create_notebook
    Notebook.create(user: self)
  end
end
