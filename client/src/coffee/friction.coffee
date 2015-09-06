_ = require 'underscore'

module.exports = (entity) ->
  FRICTION = 0.8
  entity.multVx? FRICTION
