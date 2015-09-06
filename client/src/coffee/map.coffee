_ = require 'underscore'
$ = require 'jquery'
Block = require './block'

module.exports = do ->

  class Map
    constructor: (name, scene) ->
      $.getJSON "maps/#{name}.json", (map) =>
        _.each map, (entity) ->
          if entity.type is 'block'
            scene.add new Block entity.x, entity.y
