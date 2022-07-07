module TestPassagesHelper
  def result_message(test_passages)
    test_passages.success? ? 'Тест пройден' : 'Тест не пройден'
  end

  def result_style(test_passages)
    test_passages.success? ? 'color:green' : 'color:red'
  end
end
