get '/' do
  # render home page
  @users = User.all
  if session[:user_id]
    redirect "/users/#{session[:user_id]}/cappinets"
  end

  erb :index
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new

  erb :sign_up
end

post '/users/new' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    redirect '/users/new'
  end
end

get '/users/:user_id' do
  @user = User.find_by_id(params[:user_id])

  erb :account
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions/new' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect "/users/#{session[:user_id]}/cappinets"
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/end' do
  # sign-out -- invoked via AJAX
  session.clear
  200
end


