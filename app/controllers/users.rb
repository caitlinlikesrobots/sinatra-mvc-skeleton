get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
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
  if user == nil
    @errors = ['Email Address or Password Not Found']
    erb :'/users/login'
  else
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      @errors = ['Email Address or Password Not Found']
      erb :'/users/login'
    end
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/index'
end

