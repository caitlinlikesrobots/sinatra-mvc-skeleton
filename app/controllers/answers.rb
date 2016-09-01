get '/categories/:category_id/questions/:question_id/answers/new' do
  @category = Category.find(params[:category_id])
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/categories/:category_id/questions/:question_id/answers' do
  @category = Category.find(params[:category_id])
  @question = Question.find(params[:question_id])
  @answer = Answer.new(content: params[:content], user_id: session[:user_id], question_id: params[:question_id])
  if @answer.save
  redirect "/categories/#{params[:category_id]}/questions/#{params[:question_id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/new'
  end
end

get '/categories/:category_id/questions/:question_id' do
  @category = Category.find(params[:category_id])
  @question = Question.find(params[:question_id])
  @answers = @question.answers.all
  @user = User.find(@question.user_id)
  erb :'answers/index'
end

