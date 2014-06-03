#-----------------SPICES--------------

post '/cappinets/:cappinet_id/spices/new' do
  # create -- invoked via AJAX
  @cappinet = Cappinet.find_by_id(params[:cappinet_id])
  @spice = Spice.create(name: params[:new_spice], amount: params[:spice_amount], cappinet_id: @cappinet.id)

  redirect "/cappinets/#{@cappinet.id}"
end

get '/users/:user_id/cappinets/:cappinet_id/spices/:spice_id/edit' do
  @cappinet = Cappinet.find_by_id(params[:cappinet_id])

  erb :edit_spice
end

post '/cappinets/:cappinet_id/spices/:spice_id/edit' do
  @cappinet = Cappinet.find_by_id(params[:cappinet_id])
  @spice = Spice.find_by_id(params[:spice_id])
  @spice.update_attributes(amount: session[:spice_amount])

  redirect "/cappinets/#{@cappinet.id}"
end

delete '/cappinets/:cappinet_id/spices/:spice_id/delete' do
  # delete -- invoked via AJAX
  @cappinet = Cappinet.find_by_id(params[:cappinet_id])
  @spice = Spice.find_by_id(params[:spice_id])
  @spice.delete

  redirect "/cappinets/#{@cappinet.id}"
end
