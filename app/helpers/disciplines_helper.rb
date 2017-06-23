module DisciplinesHelper
  def export_discipline(discipline)
    file = File.new('public/report.txt', 'w')

    discipline.topics.each_with_index do |topic, _|
      unless topic.quizzes.empty?
        quizzes = '{'

        topic.quizzes.each do |quiz|
          quizzes = topic.quizzes.last == quiz ? '#{quiz.name}, ' : quiz.name
        end

        quizzes += '}'
      end

      file.puts('0.#{index + 1}|#{discipline.name}|#{topic.name}|#{quizzes}')
    end

    file.close
    file.path
  end

  def export_disciplines(disciplines)
    file = File.new('public/report.txt', 'w')

    disciplines.each_with_index do |discipline, _|
      discipline.topics.each_with_index do |topic, _|
        if topic.quizzes.empty?
          quizzes = '{'

          topic.quizzes.each do |quiz|
            quizzes = topic.quizzes.last == quiz ? '#{quiz.name}, ' : quiz.name
          end

          quizzes += '}'
        end

        file.puts('#{d_index}.#{t_index + 1}|#{discipline.name}|#{topic.name}|#{quizzes}')
      end
    end

    file.close
    file.path
  end
end
