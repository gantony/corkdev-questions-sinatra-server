require 'net/http'
require 'json'


RSpec.describe 'CorkdevQuestions API' do
    # ROOT_URL = 'http://localhost:8080/gantony/CorkDevQuestions/1.0.0'
    ROOT_URL = 'http://localhost:4567/gantony/CorkDevQuestions/1.0.0'

    def get_index
        uri = URI("#{ROOT_URL}/")
        return Net::HTTP.get_response(uri)
    end

    def get_questions
        uri = URI("#{ROOT_URL}/questions")
        return Net::HTTP.get_response(uri)
    end


    num_previous_questions = nil

    describe "The list of questions" do
        it "can be retreived" do
            response = get_questions
            expect(response.code).to eq("200")
            questions = JSON.parse(response.body)
            num_previous_questions = questions.length
        end
    end

    describe "A new question" do
        added_question = nil
        it 'can be added to the list' do
            http = Net::HTTP.new("localhost", 4567)
            
            request = Net::HTTP::Post.new("/gantony/CorkDevQuestions/1.0.0/questions", 
                                            'Content-Type' => 'application/json')
            request.body = { "question" => "What is this crap about anyway???" }.to_json
            response = http.request(request)

            expect(response.code).to eq("200")
            added_question = JSON.parse(response.body)
        
            questions = JSON.parse(get_questions.body)
            expect(questions.length).to eq(num_previous_questions + 1)
        end

        it "contains the actual question" do
            expect(added_question["question"]).to be_a(String)
        end

        it "contains a vote" do
            expect(added_question["votes"]).to be_a(Integer)
        end

        it "contains an id" do
            expect(added_question["id"]).to be_a(Integer)
        end

        it 'has the expected question content' do
            expect(added_question["question"]).to include("What is this crap about anyway???")
        end
        
        it 'has 0 votes' do
            expect(added_question["votes"]).to eq(0)
        end

        it 'can be upvoted' do
            http = Net::HTTP.new("localhost", 4567)
            id = added_question["id"]
            request = Net::HTTP::Post.new("/gantony/CorkDevQuestions/1.0.0/questions/#{id}/votes", 
                                            'Content-Type' => 'application/json')
            request.body = ""
            response = http.request(request)
            expect(response.code).to eq("200")

            updated_question = JSON.parse(response.body)
            expect(updated_question["votes"]).to eq(1)
        end
    end

    
  end