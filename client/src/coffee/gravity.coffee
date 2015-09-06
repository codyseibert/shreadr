_ = require 'underscore'

module.exports = (entity) ->
  FORCE = 0.6
  entity.addVy? FORCE
