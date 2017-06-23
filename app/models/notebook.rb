##
# Esta classe representa a entidade caderno, que pertence à um usuário
# e pode ter mais de uma disciplina
class Notebook < ApplicationRecord
  ##
  # Este método estabelece o relacionamento 1-N com usuário
  belongs_to :user

  ##
  # Este método estabelece o relacionamento N-N com disciplinas
  has_and_belongs_to_many :disciplines
end
