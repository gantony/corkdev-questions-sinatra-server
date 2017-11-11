require './my_app_logic.rb'

RSpec.describe 'MyAppLogic' do

  describe "Initially" do  
    it "the list of questions is empty" do 
      expect(MyAppLogic.list_questions.length).to eq(0)        
    end
  end

  describe "A new test question" do
    it "can be added" do 
      MyAppLogic.add_question "This is a test question"
      expect(MyAppLogic.list_questions.length).to eq(1)        
    end

    it "can be retrieved by id" do 
      question = MyAppLogic.get_question 1
      expect(question[:question]).to include("This is a test question")        
    end

    it "has 0 votes so far" do
      question = MyAppLogic.get_question 1
      expect(question[:votes]).to eq(0) 
    end

    it "but we can also upvote it" do 
      MyAppLogic.upvote_question 1
      question = MyAppLogic.get_question 1
      expect(question[:votes]).to eq(1)
    end
  end

end

