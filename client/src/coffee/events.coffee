_ = require 'underscore'

module.exports = do ->

  eventMap = {}

  emit: (eventName, data) ->
    cbs = eventMap[eventName] or []
    _.each cbs, (cb) ->
      cb data

  bind: (eventName, cb) ->
    eventMap[eventName] ?= []
    eventMap[eventName].push cb
