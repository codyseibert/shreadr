context = require './context'
canvas = require './canvas'
camera = require './camera'

module.exports =
  class Renderer
    constructor: ->

    clear: ->
      context.clearRect 0, 0, canvas.width, canvas.height

    drawImage: (image, x, y) ->
      context.drawImage image, x - camera.cx(), y - camera.cy()

    drawHitBox: (x, y, width, height) ->
      context.beginPath()
      context.rect x - camera.cx(), y - camera.cy(), width, height
      context.lineWidth = 7
      context.strokeStyle = 'black'
      context.stroke()
