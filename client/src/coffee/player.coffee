physics = require './physics'
events = require './events'
Guid = require 'guid'

module.exports =
  class Player
    WIDTH = 108
    HEIGHT = 136
    GUN_OFFSET = 26
    JUMP = 8
    SPEED = 5
    MAX_VX = 5
    SHOOT_COOLDOWN = 200

    ready = 2
    imageLeft = new Image()
    imageLeft.src = 'images/player_left.png'
    imageLeft.addEventListener 'load', ->
      ready--
    imageRight = new Image()
    imageRight.src = 'images/player_right.png'
    imageRight.addEventListener 'load', ->
      ready--

    constructor: (x = 0, y = 0) ->
      @id = Guid.raw()
      @x = 0
      @y = 0
      @vy = 0
      @vx = 0
      @ax = 0
      @isInAir = true
      @canShoot = true
      @isFacingLeft = true
      @collidable = true
      @refreshHitbox()

    refreshHitbox: ->
      @left = @x
      @right = @x + WIDTH
      @top = @y
      @bottom = @y + HEIGHT

    walkLeft: ->
      @ax = -SPEED
      @isFacingLeft = true

    walkRight: ->
      @ax = SPEED
      @isFacingLeft = false

    stopWalk: ->
      @ax = 0

    shoot: ->
      return if not @canShoot
      @canShoot = false
      events.emit 'bullet',
        x: @x
        y: @y + GUN_OFFSET
        left: @isFacingLeft
      setTimeout =>
        @canShoot = true
      , SHOOT_COOLDOWN

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
      return if ready isnt 0
      image = if @isFacingLeft then imageLeft else imageRight
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
