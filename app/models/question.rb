##
# Esta classe representa a entidade questão, que pertence à um questionário
# e possui muitas questões
class Question < ApplicationRecord
  ##
  # Este método estabelece o relacionameto 1-N com o questionário
  belongs_to :quiz

  validates :statement, presence: true

  ##
  # Este método estabelece o relacionamento 1-N com
  # resposta e com exclusão em cascata
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  after_create :set_score

  def set_score
    update_attribute(:score, 1) if score.nil?
  end
end
