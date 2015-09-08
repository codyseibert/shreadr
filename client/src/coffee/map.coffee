_ = require 'underscore'
$ = require 'jquery'
Block = require './block'
api = require './api'

module.exports = do ->

  class Map

    constructor: (id, entities, scene) ->
      @id = id
      @entities = entities
      _.each entities, (entity) ->
        if entity.type is 'block'
          scene.add new Block entity.x, entity.y

    persist: ->
      $.ajax
        url: "#{api.MAPS}/#{@id}"
        type: 'PUT'
        contentType: 'application/json'
        data: JSON.stringify(entities: @entities)
        success: (data) ->

    add: (entity) ->
      @entities.push entity

    remove: (entity) ->
      index = _.findIndex @entities, (e) ->
        e.id is entity.id
      @entities.splice index, 1
