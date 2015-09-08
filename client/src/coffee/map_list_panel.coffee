$ = require 'jquery'
_ = require 'underscore'
canvas = require './canvas'
events = require './events'
api = require './api'

# TODO: Use Mustache Templates
# (or something similar)
module.exports = ->

  BASE_URL = 'http://localhost:10000'

  $panel = $('.panels .maps')
  $panel.hide()
  $new = $panel.find('.new')
  $name = $panel.find('.name')
  $maplist = $panel.find('.maplist')

  createMapItem = (id, name) ->
    $item = $('<div></div>')
    $item.addClass 'item'
    $item.data 'id', id
    $item.append($('<span></span>').html name)

    $item.click ->
      id = $(this).data('id')
      $.get("#{api.MAPS}/#{id}").then (data) ->
        events.emit 'map', data

    $maplist.append $item

  $new.click ->
    name = $name.val()
    $.post "#{api.MAPS}",
      name: name
      entities: []
    .then (id) ->
      $name.val ''
      createMapItem id, name

  refresh: ->
    $panel.css 'left', canvas.width / 2 - $panel.width() / 2
    $panel.css 'top', canvas.height / 2 - $panel.height() / 2

  isVisible: ->
    $panel.is(':visible')

  show: ->
    $panel.show()
    $.get("#{api.MAPS}").then (maps) ->
      _.each maps, (map) ->
        createMapItem map._id, map.name

  hide: ->
    $panel.hide()
    $maplist.empty()
