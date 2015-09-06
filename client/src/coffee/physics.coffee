_ = require 'underscore'
collision = require './collision'

module.exports = do ->

  class Physics
    constructor: (scene) ->
      @scene = scene

    apply: (entity) =>
      return if not entity.collidable

      _.each @scene.entities, (e) ->
        return if e is entity
        return if not e.collidable
        if collision.touching e, entity
          entity.stop?()
        else
          entity.isInAir = true
