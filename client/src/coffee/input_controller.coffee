$ = require 'jquery'

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
