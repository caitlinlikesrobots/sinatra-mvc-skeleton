get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :'categories/questions'
end

post '/categories/:id' do
  @question = Question.new(params[:question])

end
