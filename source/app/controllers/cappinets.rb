#-----------------CAPPINETS--------------

get '/users/:user_id/cappinets/new' do
  # make new cappinet

  erb :new_cappinet
end

post '/cappinets/new' do
  # create -- invoked via AJAX
  @cappinet = Cappinet.create(name: params[:cappinet_name], user_id: session[:user_id])

  redirect "/users/#{session[:user_id]}/cappinets/#{@cappinet.id}"
end

get '/users/:user_id/cappinets' do
  # show all user cappinets
  if params[:user_id].to_i != session[:user_id]
    redirect '/'
  end

  @user = User.find_by_id(params[:user_id])
  @cappinets = @user.cappinets

  erb :user_cappinets
end

get '/users/:user_id/cappinets/:cappinet_id' do
  # cappinet page
  p session[:user_id]
  if params[:user_id].to_i != session[:user_id]
    redirect '/'
  end

  @cappinet = Cappinet.find_by_id(params[:cappinet_id])
  @spices = @cappinet.spices

  erb :cappinet
end

get '/users/:user_id/cappinets/:cappinet_id/edit' do
  @cappinet = Cappinet.find_by_id(params[:cappinet_id])

  erb :edit_cappinet
end

