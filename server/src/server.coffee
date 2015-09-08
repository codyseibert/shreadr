require('./db').then ->
  require('./routes')
  require('./app').listen 10000
