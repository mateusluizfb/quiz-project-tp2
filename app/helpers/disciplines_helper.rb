module DisciplinesHelper
  def export_discipline(discipline)
    file = File.new('public/report.txt', 'w')

    discipline.topics.each_with_index do |topic, index|
      file.puts("0.#{index + 1}|#{discipline.name}|#{topic.name}")
    end

    file.close
    
    return file.path
  end

  def export_disciplines(disciplines)
    file = File.new('public/report.txt', 'w')

    disciplines.each_with_index do |discipline, d_index|
      discipline.topics.each_with_index do |topic, t_index|
        file.puts("#{d_index}.#{t_index + 1}|#{discipline.name}|#{topic.name}")
      end
    end

    file.close

    return file.path
  end
end
