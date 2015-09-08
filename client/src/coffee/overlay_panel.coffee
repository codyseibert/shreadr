$ = require 'jquery'
_ = require 'underscore'
canvas = require './canvas'

module.exports = ->

  $panel = $('.panels .overlay')
  $panel.hide()

  refresh: ->

  show: ->
    $panel.show()

  hide: ->
    $panel.hide()

  isVisible: ->
    $panel.is(':visible')
