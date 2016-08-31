get '/' do
  @categories = Category.all
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/login' do
  erb :'users/login'
end

post'/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

