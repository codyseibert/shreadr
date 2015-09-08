$ = require 'jquery'
_ = require 'underscore'
canvas = require './canvas'
events = require './events'

module.exports = do ->

  baseUrl = 'http://localhost:10000'
  maps =  "#{baseUrl}/maps"

  BASE_URL: baseUrl
  MAPS: maps
