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

  friction = require './friction'
  gravity = require './gravity'

  require './window'

  renderer = new Renderer()
  scene = new Scene
  physics = new Physics scene

  player = new Player()
  inputController = new InputController player

  # Add all entities here
  scene.add player

  for i in [0..30]
    scene.add new Block i * Block.WIDTH, 500

  update = (delta) ->
    inputController.update delta
    scene.apply gravity
    scene.apply friction
    scene.apply physics.apply
    scene.update delta

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
