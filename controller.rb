require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative './models/pizza_order'
require_relative './models/customer'

get '/pizzas' do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

get '/pizza/new' do
  @customers = Customer.all 
  erb(:new)
end

get '/pizza/:id' do
  @pizza = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizzas' do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

get '/pizza/:id/edit' do 
  @pizza = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza/:id' do
  @pizza = PizzaOrder.find(params[:id])
  @pizza.update(params)
  redirect to "/pizza/#{params[:id]}"
end

post '/pizza/:id/delete' do
  @pizza = PizzaOrder.find(params[:id])
  @pizza.delete()
  redirect to "/pizzas"
end

get '/customers' do
  @customers = Customer.all()
  erb(:index_cust)
end

get '/customer/:id' do
  @customer = Customer.find(params[:id])
  erb(:show_cust)
end

get '/customer/new' do #???
  @customer = Customer.all 
  erb(:new_cust)
end

post '/customers' do #???
  @customer = Customer.new(params)
  @customer.save()
  erb(:create_cust)
end

get '/customer/:id/edit' do
  @customer = Customer.find(params[:id])
  erb(:cust_edit)
end

post '/customer/:id' do
  @customer = Customer.find(params[:id])
  @customer.update(params)
  redirect to "/customer/#{params[:id]}"
end

post '/customer/:id/delete' do #???
  @customer = Customer.find(params[:id])
  @customer.delete()
  redirect to "/customers"
end



