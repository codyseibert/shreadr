Promise = require 'bluebird'
fs = require 'fs'
filewalker = require 'filewalker'
path = require 'path'
ObjectId = require('mongodb').ObjectId
Map = require '../models/map'

module.exports = do ->
  # TODO: Validate inputs
  
  index = (req, res) ->
    Map.find({}).toArray (err, maps) ->
      res.status 200
      res.send maps

  show = (req, res) ->
    Map.find
      _id: ObjectId req.params.id
    .toArray (err, maps) ->
      # TODO: Find better way to do this
      res.status 200
      res.send maps[0]

  put = (req, res) ->
    Map.update
      _id: ObjectId req.params.id
    , req.body
    , (err, map) ->
      res.status 200
      res.send 'success'

  post = (req, res) ->
    Map.save req.body, (err, map) ->
      res.status 200
      res.send 'success'

  index: index
  show: show
  put: put
  post: post
