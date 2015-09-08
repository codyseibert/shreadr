# TODO: REFACTOR
Promise = require 'bluebird'
mongodb = require 'mongodb'

module.exports = do ->
  new Promise (res, rej) ->
    client = mongodb.MongoClient
    client.connect "mongodb://localhost:27017/shreadr", (err, db) ->
      # TODO: REFACTOR
      global.db = db
      res()
