post '/categories/:category_id/questions/:question_id' do
  @user = User.find(session[:user_id])
  @answer = Answer.find((params[:answer].to_i))
  @vote = Vote.create(value: 1, votable: @answer, user_id: @user.id)
  if request.xhr?
    content_type :json
    { answer_id: @answer.id, points: @answer.total_votes}.to_json
  elsif
    redirect "/categories/#{params[:category_id]}/questions/#{params[:question_id]}"
  else
    erb :'answers/index'
  end
end
