physics = require './physics'

module.exports =
  class Player
    WIDTH = 108
    HEIGHT = 136
    JUMP = 8
    SPEED = 5
    MAX_VX = 5

    ready = false
    image = new Image()
    image.src = 'http://cdn.wikimg.net/strategywiki/images/4/4a/Bionic_Commando_player_sprite.png'
    image.addEventListener 'load', ->
      ready = true

    constructor: (x = 0, y = 0) ->
      @x = 0
      @y = 0
      @vy = 0
      @vx = 0
      @ax = 0
      @isInAir = true
      @refreshHitbox()

    refreshHitbox: ->
      @left = @x
      @right = @x + WIDTH
      @top = @y
      @bottom = @y + HEIGHT

    walkLeft: ->
      @ax = -SPEED

    walkRight: ->
      @ax = SPEED

    stopWalk: ->
      @ax = 0

    jump: ->
      @vy = -JUMP
      @y -= 5
      @isInAir = true

    stop: ->
      @vy = 0

    addVy: (amount) ->
      @vy += amount

    multVx: (amount) ->
      @vx *= amount

    render: (renderer) ->
      return if not ready
      renderer.drawImage image, @x, @y
      renderer.drawHitBox @x, @y, WIDTH, HEIGHT

    update: (delta) ->
      #TODO: Use Delta to update distance

      # update velocities
      @vx += @ax
      if @vx < 0
        @vx = Math.max -MAX_VX, @vx
      else if @vx > 0
        @vx = Math.min MAX_VX, @vx

      # update positions
      @x += @vx
      @y += @vy

      @refreshHitbox()
