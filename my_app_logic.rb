class MyAppLogic
  @@id_counter = 0
  @@questions = []

  def self.get_id
    @@id_counter += 1
    @@id_counter
  end

  def self.add_question question
    new_question = { :id => get_id, :question => question, :votes => 0 }
    @@questions.push new_question
    new_question
  end

  def self.get_question id
    @@questions.select { |q| q[:id] == id } .first
  end

  def self.upvote_question id
    question = @@questions.select { |q| q[:id] == id } .first
    question[:votes] += 1
    question
  end


  def self.list_questions
    @@questions
  end

  def self.reset
    @@id_counter = 0
    @@questions = []
  end
end

