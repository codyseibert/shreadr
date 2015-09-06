canvas = require './canvas'

module.exports = do ->

  cx = 0
  cy = 0

  set: (entity) ->
    cx = entity.x - canvas.width / 2
    cy = entity.y - canvas.height / 2
  cx: -> cx
  cy: -> cy
