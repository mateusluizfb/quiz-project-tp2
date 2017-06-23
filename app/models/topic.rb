##
# Esta classe representa a entidade tópico, que pertence à
# uma disciplina e possui muitos questionários
class Topic < ApplicationRecord
  ##
  # Este método estabelece o relacionamento 1-N
  # com questionário e exclusão em cascata
  has_many :quizzes, dependent: :destroy

  ##
  # Este método estabelece o relacionamento 1-N com disciplina
  belongs_to :discipline

  accepts_nested_attributes_for :quizzes, reject_if: :all_blank, allow_destroy: true

  ##
  # Nome obrigatório
  validates_presence_of :name
end
