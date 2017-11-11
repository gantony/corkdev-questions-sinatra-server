require 'json'


MyApp.add_route('POST', '/gantony/CorkDevQuestions/1.0.0/questions', {
  "resourcePath" => "/Public",
  "summary" => "new question",
  "nickname" => "add_question", 
  "responseClass" => "Question", 
  "endpoint" => "/questions", 
  "notes" => "Adds a question to the talk",
  "parameters" => [
    {
      "name" => "body",
      "description" => "Question to add",
      "dataType" => "Question",
      "paramType" => "body",
    }
    ]}) do
  cross_origin
  # the guts live here

  request_json = JSON.parse(request.body.read)
  new_question = MyAppLogic.add_question request_json["question"]

  new_question.to_json
end


MyApp.add_route('GET', '/gantony/CorkDevQuestions/1.0.0/questions', {
  "resourcePath" => "/Public",
  "summary" => "questions",
  "nickname" => "list_questions", 
  "responseClass" => "array[Question]", 
  "endpoint" => "/questions", 
  "notes" => "Get a list of all the available questions for this talk ",
  "parameters" => [
    ]}) do
  cross_origin
  # the guts live here

  MyAppLogic.list_questions.to_json
end


MyApp.add_route('POST', '/gantony/CorkDevQuestions/1.0.0/questions/{id}/votes', {
  "resourcePath" => "/Public",
  "summary" => "upvote",
  "nickname" => "upvote", 
  "responseClass" => "int", 
  "endpoint" => "/questions/{id}/votes", 
  "notes" => "Upvote a question for the talk so that it goes up the list (we may not have time to answer all questions)",
  "parameters" => [
    {
      "name" => "id",
      "description" => "ID of question to upvote",
      "dataType" => "int",
      "paramType" => "path",
    },
    ]}) do
  cross_origin
  # the guts live here

  # TODO: Implement this!
  {"message" => "yes, it worked"}.to_json
end

