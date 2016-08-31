delete '/categories/:category_id/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @question.destroy
  p "I destroyed"

  redirect "/categories/#{params[:category_id]}"
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :'categories/questions'
end

post '/categories/:id' do
  p "!!!!!!!!!!!!!!!!!!!!!!!!"
  p params
  @question = Question.create(title: params[:title], content: params[:content], user_id: session[:user_id], category_id: params[:id])
  redirect '/'
end


