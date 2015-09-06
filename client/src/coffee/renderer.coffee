context = require './context'
canvas = require './canvas'

module.exports =
  class Renderer
    constructor: ->

    clear: ->
      context.clearRect 0, 0, canvas.width, canvas.height

    drawImage: (image, x, y) ->
      context.drawImage image, x, y

    drawHitBox: (x, y, width, height) ->
      context.beginPath()
      context.rect(x, y, width, height)
      context.lineWidth = 7
      context.strokeStyle = 'black'
      context.stroke()
