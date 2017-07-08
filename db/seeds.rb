# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Excluindo usuários"
User.destroy_all
puts "Excluindo quizzes"
Quiz.destroy_all
puts "Excluindo tópicos"
Topic.destroy_all
puts "Excluindo disciplinas"
Discipline.destroy_all

puts "Criando usuário admin"
User.create(login: "admin", password: "12345678", email: "admin@admin.com", admin: "true", name: "Administrador")

puts "Criando disciplinas"
matematica = Discipline.create(name: 'Matemática')
computacao = Discipline.create(name: 'Computação')

puts "Criando tópicos"

adicao = Topic.create(name: 'Adição')
subtracao = Topic.create(name: 'Subtração')

numeros_binarios = Topic.create(name: 'Números Binários')
numeros_hexadecimais = Topic.create(name: 'Números Hexadecimais')

puts "Associando tópicos com disciplinas"
matematica.topics << adicao
matematica.topics << subtracao

matematica.save

computacao.topics << numeros_binarios
computacao.topics << numeros_hexadecimais

computacao.save

puts "Criando quizzes"
quiz1 = Quiz.create(name: 'Quiz do Rodrigo Chaves')
quiz2 = Quiz.create(name: 'Quiz do Rodrigo Quico')
quiz3 = Quiz.create(name: 'Quiz do Rodrigo Chiquinha')
quiz4 = Quiz.create(name: 'Quiz do Rodrigo Madruga')

puts "Associando quizzes com tópicos"
adicao.quizzes << quiz1
adicao.save

subtracao.quizzes << quiz2
subtracao.save

numeros_binarios.quizzes << quiz3
numeros_binarios.save

numeros_hexadecimais.quizzes << quiz4
numeros_hexadecimais.save

puts "Criando questão 1"
q1 = quiz1.questions.create(statement: 'Quanto é 1+1?', score: 1)
q1.answers.create(text: '2', correct_option: true)
q1.answers.create(text: '4', correct_option: false)
q1.answers.create(text: '6', correct_option: false)

puts "Criando questão 2"
q2 = quiz1.questions.create(statement: 'Quanto é 2+2?', score: 1)
q2.answers.create(text: '2', correct_option: false)
q2.answers.create(text: '4', correct_option: true)
q2.answers.create(text: '6', correct_option: false)

puts "Criando questão 3"
q3 = quiz1.questions.create(statement: 'Quanto é 3+3?', score: 1)
q3.answers.create(text: '2', correct_option: false)
q3.answers.create(text: '4', correct_option: false)
q3.answers.create(text: '6', correct_option: true)


puts "Criando questão 1"
q1 = quiz2.questions.create(statement: 'Quanto é 1-1?', score: 1)
q1.answers.create(text: '0', correct_option: true)
q1.answers.create(text: '2', correct_option: false)
q1.answers.create(text: '-1', correct_option: false)

puts "Criando questão 2"
q2 = quiz2.questions.create(statement: 'Quanto é 2-3?', score: 1)
q2.answers.create(text: '0', correct_option: false)
q2.answers.create(text: '-1', correct_option: true)
q2.answers.create(text: '2', correct_option: false)

puts "Criando questão 3"
q3 = quiz2.questions.create(statement: 'Quanto é 3-1?', score: 1)
q3.answers.create(text: '3', correct_option: false)
q3.answers.create(text: '6', correct_option: false)
q3.answers.create(text: '2', correct_option: true)


puts "Criando questão 1"
q1 = quiz3.questions.create(statement: 'Quanto é 0b10 em decimal?', score: 1)
q1.answers.create(text: '1', correct_option: false)
q1.answers.create(text: '2', correct_option: true)
q1.answers.create(text: '3', correct_option: false)

puts "Criando questão 2"
q2 = quiz3.questions.create(statement: 'Quanto é 0b101 em decimal?', score: 1)
q2.answers.create(text: '3', correct_option: false)
q2.answers.create(text: '2', correct_option: false)
q2.answers.create(text: '5', correct_option: true)

puts "Criando questão 3"
q3 = quiz3.questions.create(statement: 'Quanto é 0b1101 em decimal?', score: 1)
q3.answers.create(text: '13', correct_option: true)
q3.answers.create(text: '15', correct_option: false)
q3.answers.create(text: '17', correct_option: false)


puts "Criando questão 1"
q1 = quiz4.questions.create(statement: 'Quanto é 0x2ADE em decimal?', score: 1)
q1.answers.create(text: '10954', correct_option: false)
q1.answers.create(text: '10974', correct_option: true)
q1.answers.create(text: '10964', correct_option: false)

puts "Criando questão 2"
q2 = quiz4.questions.create(statement: 'Quanto é 0x2C0B em decimal?', score: 1)
q2.answers.create(text: '11375', correct_option: false)
q2.answers.create(text: '11575', correct_option: false)
q2.answers.create(text: '11275', correct_option: true)

puts "Criando questão 3"
q3 = quiz4.questions.create(statement: 'Quanto é 0xF0CA em decimal?', score: 1)
q3.answers.create(text: '61642', correct_option: true)
q3.answers.create(text: '61442', correct_option: false)
q3.answers.create(text: '61662', correct_option: false)