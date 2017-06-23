##
# Esta classe representa a entidade disciplina, que possui muitos tópicos
# e pertence à diversos cadernos de usuários
class Discipline < ApplicationRecord
  ##
  # Este método estabelece o relacionamento 1-N com exclusão em cascata
  has_many :topics, dependent: :destroy

  ##
  # Esse método estabele o relacionamento N-N com cadernos
  has_and_belongs_to_many :notebooks

  accepts_nested_attributes_for :topics, reject_if: :all_blank, allow_destroy: true

  ##
  # Nome obrigatório
  validates_presence_of :name
end
