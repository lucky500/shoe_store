require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each{ |file| require file }


get("/") do
  @stores = Store.all
  erb(:index)
end

post("/add_store") do
  store = Store.new({:name => params['name']})
  if store.save
      redirect '/'
  else
    @error_type = store
    erb(:errors)
  end
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id"))
  erb(:store)
end

get("/stores/:id/edit") do
  @store = Store.find(params[:id].to_i)
  erb(:store_edit)
end

patch("/stores/:id") do
  name = params.fetch('name')
  @store = Store.find(params[:id].to_i)
  @store.update({:name => name })
  redirect '/stores/' + @store.id.to_s
end

delete("/stores/:id") do
  @store = Store.find(params["id"].to_i)
  @store.delete()
  @stores = Store.all()
  redirect '/'
end



