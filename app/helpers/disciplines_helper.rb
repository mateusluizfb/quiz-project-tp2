module DisciplinesHelper
  def export_discipline(discipline)
    file = File.new('public/report.txt', 'w')

    discipline.topics.each_with_index do |topic, index|
      unless topic.quizzes.empty?
        quizzes = "{"

        topic.quizzes.each do |quiz|
          unless topic.quizzes.last == quiz
            quizzes += "#{quiz.name}, "
          else
            quizzes += quiz.name
          end
        end

        quizzes += "}"
      end

      file.puts("0.#{index + 1}|#{discipline.name}|#{topic.name}|#{quizzes}")
    end

    file.close
    
    return file.path
  end

  def export_disciplines(disciplines)
    file = File.new('public/report.txt', 'w')

    disciplines.each_with_index do |discipline, d_index|
      discipline.topics.each_with_index do |topic, t_index|
        unless topic.quizzes.empty?
          quizzes = "{"

          topic.quizzes.each do |quiz|
            unless topic.quizzes.last == quiz
              quizzes += "#{quiz.name}, "
            else
              quizzes += quiz.name
            end
          end

          quizzes += "}"
        end

        file.puts("#{d_index}.#{t_index + 1}|#{discipline.name}|#{topic.name}|#{quizzes}")
      end
    end

    file.close

    return file.path
  end
end
