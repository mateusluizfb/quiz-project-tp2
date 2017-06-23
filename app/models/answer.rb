##
# Esta classe representa a entidade resposta, que pertence à uma questão
# de um questionário
class Answer < ApplicationRecord
  ##
  # Texto obrigatório
  validates_presence_of :text, presence: true

  ##
  # Opção correta obrigatório
  validates_presence_of :correct_option, presence: true

  belongs_to :question
end
