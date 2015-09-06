module.exports =
  class Block
    @WIDTH = 32
    @HEIGHT = 32

    ready = false
    image = new Image()
    image.src = 'http://professorklein.com/production/help/gamemaker_pc/GM%20Tutorials/GM%20Tutorial%20-%20Maze%20Games/Resources/wall.gif'
    image.addEventListener 'load', ->
      ready = true

    constructor: (x = 0, y = 0)->
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
