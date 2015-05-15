require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:band_list)
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  @venues = Venue.all()
  erb(:band_detail)
end

post('/add_band') do
  name = params.fetch("band_name")
  Band.create({:name => name})
  @bands = Band.all()
  erb(:band_list)
end

patch('/band/:id/edit') do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i)
  @band.update({:name => name})
  @venues = Venue.all()
  erb(:band_detail)
end

delete('/band/:id/delete') do
  @band_delete = Band.find(params.fetch("id").to_i)
  @band_delete.delete()
  @bands = Band.all()
  erb(:band_list)
end
