app = require('./app')
mapsController = require('./controllers/maps_controller')
module.exports = do ->
  app.get '/maps', mapsController.index
  app.get '/maps/:id', mapsController.show
  app.post '/maps', mapsController.post
  app.put '/maps/:id', mapsController.put
