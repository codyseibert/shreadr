$ = require 'jquery'
events = require './events'
camera = require './camera'
Block = require './block'

module.exports =
  class InputController
    W = 87
    S = 83
    A = 65
    D = 68
    E = 69
    SPACE = 32
    keyMap = {}

    $(document).keydown (event) ->
      keyMap[event.which || event.keyCode] = true
      # console.log event.which || event.keyCode

    $(document).keyup (event) ->
      keyMap[event.which || event.keyCode] = false

    $(document).click (event) ->
      extra = if event.clientX + camera.cx() < 0 then -1 else 0
      nx = parseInt((event.clientX + camera.cx()) / Block.WIDTH + extra) * Block.WIDTH
      ny = parseInt((event.clientY + camera.cy()) / Block.WIDTH) * Block.WIDTH

      events.emit 'block',
        x: event.clientX + camera.cx()
        y: event.clientY + camera.cy()
        nx: nx
        ny: ny

    $(document).mousemove (event) ->
      # TODO: if debug mode, set opacity block over mouse cursor
      # mx = event.clientX
      # my = event.clientY
      # mx = parseInt(mx / 64) * 64
      # my = parseInt(my / 64) * 64
      # console.log mx, my

    constructor: (player) ->
      @player = player

    update: ->
      # if keyMap[W]
      #   @player.moveUp()
      # else if keyMap[S]
      #   @player.moveDown()

      if keyMap[A]
        @player.walkLeft()
      else if keyMap[D]
        @player.walkRight()
      else
        @player.stopWalk()

      if keyMap[SPACE]
        @player.jump()

      if keyMap[E]
        @player.shoot()
