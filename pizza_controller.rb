require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
# require_relative('./models/*')
also_reload('./models/*')

#HOME
get '/' do
  erb( :home)
end


#INDEX

get '/pizza-orders' do
  @orders = PizzaOrder.all
  erb(:index) # =>need to create an index.erb in the views folder
end

#NEW

get '/pizza-orders/new' do
  erb(:new)
end

#SHOW

get '/pizza-orders/:id' do #show
  @order = PizzaOrder.find( params[:id] )
  erb( :show)
end

#CREATE

# post '/pizza-orders' do
#   p params
#   redirect to '/pizza_orders'
# end

post '/pizza-orders' do
  order = PizzaOrder.new(params)
  order.save()
  redirect to '/pizza-orders'
end

#EDIT
#UPDATE
#DELETE

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find( params[:id] )
  @order.delete()
  redirect to '/pizza-orders'
end
