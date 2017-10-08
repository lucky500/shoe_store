require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each{ |file| require file }


get("/") do
  @stores = Store.all
  erb(:index)
end

get("/brands") do
  @brands = Brand.all
  erb(:brands)
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

post("/add_brand") do
  brand = Brand.new({:name => params['name'], :model => params['model'], :price => params['price']})
  if brand.save
    redirect'/brands'
  else
    @error_type = brand
    erb(:errors)
  end
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i)
  @brands = Brand.all
  erb(:store)
end

post('/add-brand-to-store/:id') do
  @store = Store.find(params[:id])
  @brand = Brand.find(params["brand_id"])
  @store.brands.push(@brand)
  redirect back
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



