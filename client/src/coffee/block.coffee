Guid = require 'guid'
module.exports =
  class Block
    @WIDTH = 64
    @HEIGHT = 64

    ready = false
    image = new Image()
    image.src = 'images/block.png'
    image.addEventListener 'load', ->
      ready = true

    constructor: (x = 0, y = 0) ->
      @id = Guid.raw()
      @x = x
      @y = y
      @left = x
      @right = x + Block.WIDTH
      @top = y
      @collidable = true
      @bottom = y + Block.HEIGHT

    render: (renderer) ->
      return if not ready
      renderer.drawImage image, @x, @y

    update: (delta) ->
