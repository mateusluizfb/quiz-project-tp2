##
# Esta classe representa a entidade resposta, que pertence à uma questão
# de um questionário
class Answer < ApplicationRecord
  belongs_to :question
end
