_ = require 'underscore'

module.exports = do ->

  touching = (r1, r2) ->
    not (
      r2.left > r1.right or
      r2.right < r1.left or
      r2.top > r1.bottom or
      r2.bottom < r1.top
    )

  class Physics
    constructor: (scene) ->
      @scene = scene

    apply: (entity) =>
      return if not entity.collidable

      _.each @scene.entities, (e) ->
        return if e is entity
        return if not e.collidable
        if touching e, entity
          entity.stop?()
        else
          entity.isInAir = true
