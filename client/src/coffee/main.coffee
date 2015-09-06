# TODO:
# EARLY DEV
# - Create a simple map maker
# - Fix collision bug related to the player being able to walk left/right through blocks
# - Add mobs
# - Bullets from player should injure mobs
# - Mobs should die
# - add simple mob AI
# - add a GUI (heads up display)

# MID DEV
# - different types of blocks
# - slime block (slow)
# - ice block (slide)
# - fire block (damage)
# - poision block (dot)
# - bounce block (like half-life bouncer / spring)
# - teleporting block

# LATE DEV
# - Multiplayer support (client/server)
# - Ability for multiple people to build up a map and play on it

$ = require 'jquery'
_ = require 'underscore'

$(document).ready ->
  Player = require './player'
  Bullet = require './bullet'
  InputController = require './input_controller'
  Renderer = require './renderer'
  Scene = require './scene'
  Block = require './block'
  Physics = require './physics'
  Map = require './map'
  camera = require './camera'
  collision = require './collision'

  events = require './events'

  friction = require './friction'
  gravity = require './gravity'

  require './window'

  renderer = new Renderer()
  scene = new Scene()
  physics = new Physics scene

  player = new Player()
  inputController = new InputController player

  # Add all entities here
  scene.add player

  new Map 'map0', scene

  # TODO: Should these live in the scene, or in main, or somewhere else?
  events.bind 'bullet', (data) ->
    theta = if not data.left then 0 else Math.PI
    scene.add new Bullet data.x, data.y, theta

  clickToRect = (click) ->
    click.left = click.x
    click.top = click.y
    click.bottom = click.y
    click.right = click.x

  wasClickOnBlock = (click) ->
    _.findIndex scene.entities, (entity) ->
      return false if not (entity instanceof Block)
      collision.touching click, entity

  events.bind 'block', (click) ->
    clickToRect click
    index = wasClickOnBlock(click)
    if index is -1
      scene.add new Block click.nx, click.ny
    else
      scene.remove scene.entities[index]

  events.bind 'delete', (entity) ->
    scene.remove entity

  update = (delta) ->
    inputController.update delta
    scene.apply gravity
    scene.apply friction
    scene.apply physics.apply
    scene.update delta
    camera.set player

  render = ->
    renderer.clear()
    scene.render renderer

  lastUpdate = new Date()
  setInterval ->
    now = new Date()
    delta = now - lastUpdate
    update delta
    lastUpdate = now
  , 10

  window.requestAnimationFrame = do ->
    window.requestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame    ||
    window.oRequestAnimationFrame      ||
    window.msRequestAnimationFrame     ||
    (callback) ->
      setTimeout(render, 1000 / 60)

  (recursiveAnim = () ->
    render()
    requestAnimationFrame recursiveAnim
  )()
