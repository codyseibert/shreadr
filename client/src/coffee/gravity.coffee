_ = require 'underscore'

module.exports = (entity) ->
  FORCE = 0.4
  entity.addVy? FORCE
