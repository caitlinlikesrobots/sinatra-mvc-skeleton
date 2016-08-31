get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  puts "++++++++++++++++++++++++++++++++++++++++"
  p params
  @question = Question.find(params[:question_id])
  Answer.create(content: params[:content], user_id: session[:user_id], question_id: params[:question_id])
  redirect "/questions/#{params[:question_id]}/answers"
end

get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers.all
  @user = User.find(@question.user_id)
  erb :'answers/index'
end

