$ = require 'jquery'
context = require './context'
panels = require './panels'

module.exports = do ->

  setCanvasDim = ->
    width = window.innerWidth
    height = window.innerHeight
    context.canvas.width  = width
    context.canvas.height = height
    # context.translate width / 2, height / 2

  window.addEventListener 'resize', ->
    setCanvasDim()

  setCanvasDim()
