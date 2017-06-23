##
# Esta classe é pai de todas as classes de model que representam
# as entidades do nosso sistema, é aqui que são herdados os atributos
# e métodos da camada de persistência, utilizando o padrão de projeto
# ActiveRecord
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
