module.exports =
  class Bullet
    WIDTH = 5
    HEIGHT = 5
    SPEED = 20

    ready = 2
    # TODO: Refactor this uglyness (some with in player / block)
    imageLeft = new Image()
    imageLeft.src = 'images/bullet_left.png'
    imageLeft.addEventListener 'load', ->
      ready--
    imageRight = new Image()
    imageRight.src = 'images/bullet_right.png'
    imageRight.addEventListener 'load', ->
      ready--

    constructor: (x = 0, y = 0, theta = 0) ->
      @x = x
      @y = y
      @vx = 0
      @vy = 0
      @theta = theta
      @collidable = false
      @refreshHitbox()

    # TODO: Abstract from player and into
    # helper function or base class
    refreshHitbox: ->
      @left = @x
      @right = @x + WIDTH
      @top = @y
      @bottom = @y + HEIGHT

    update: ->
      @x += SPEED * Math.cos @theta, @vx
      @y += SPEED * Math.sin @theta, @vy

    render: (renderer) ->
      return if ready isnt 0
      image = if @theta is 0 then imageLeft else imageRight
      renderer.drawImage image, @x, @y
