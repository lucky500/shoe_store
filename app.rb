require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each{ |file| require file }


get("/") do
  @stores = Store.all
  erb(:index)
end

post("/add_store") do
  store = Store.new({:name => params['name']})
  store.save()
  # if recipe.save
  #   redirect '/'
  # else
  redirect '/'
end