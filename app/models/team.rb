##
# Esta classe representa a entidade equipe, que pode ter
# um ou mais usuários
class Team < ApplicationRecord
  ##
  # Este método estabelece o relacionamento N-N com usuário
  has_and_belongs_to_many :users

  ##
  # Nome obrigatório
  validates_presence_of :name
end
