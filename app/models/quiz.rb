##
# Esta classe representa a entidade questionário, que pertence à um tópico
# de uma disciplina e possui muitas questões
class Quiz < ApplicationRecord
  ##
  # Este método estabelece o relacionamento 1-N com tópico
  belongs_to :topic

  ##
  # Este método estabelece o relacionamento 1-N com
  # questões e com exclusão em cascata
  has_many :questions, dependent: :destroy, inverse_of: :quiz

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  ##
  # Nome obrigatório
  validates :name, presence: true
end
