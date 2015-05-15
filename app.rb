require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all
  erb(:band_list)
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  @venues = Venue.all
  erb(:band_detail)
end

post('/add_band') do
  @new_band = Band.new({:name => params.fetch("band_name")})
  if @new_band.save
    @bands = Band.all
    erb(:band_list)
  else
    erb(:errors_band)
  end
end

patch('/band/:id/edit') do
  name = params.fetch("name")
  @new_band = Band.find(params.fetch("id").to_i)
  if @new_band.update({:name => name})
    @venues = Venue.all
    erb(:band_detail)
  else
    erb(:errors_band)
  end
end

delete('/band/:id/delete') do
  @band_delete = Band.find(params.fetch("id").to_i)
  @band_delete.delete
  @bands = Band.all
  erb(:band_list)
end

post('/add_venue/:id') do
  name = params.fetch("venue_name")
  band_id = params.fetch("id")
  @new_venue = Venue.new({:name => name, :band_ids => band_id})
  if @new_venue.save
    @band = Band.find(params.fetch("id").to_i)
    @venues = Venue.all
    erb(:band_detail)
  else
    erb(:errors_venue)
  end
end

post('/add_venue') do
  venue = params.fetch("venue_name")
  @new_venue = Venue.new({:name => venue})
  if @new_venue.save
    @bands = Band.all
    erb(:band_list)
  else
    erb(:errors_venue)
  end
end

get('/:venue_id/:band_id/add_venue_band') do
  band_id = params.fetch("band_id")
  @venue = Venue.find(params.fetch("venue_id").to_i)
  @venue.update({:band_ids => band_id})
  @band = Band.find(params.fetch("band_id").to_i)
  @venues = Venue.all
  erb(:band_detail)
end
