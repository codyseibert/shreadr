_ = require 'underscore'
$ = require 'jquery'

MapListPanel = require './map_list_panel'
OverlayPanel = require './overlay_panel'

module.exports = do ->

  panels =
    MapListPanel: MapListPanel()
    OverlayPanel: OverlayPanel()

  refresh: ->
    _.each panels, (panel, name) ->
      panel.refresh()

  show: (panelName) ->
    panels[panelName].show()

  hide: (panelName) ->
    panels[panelName].hide()

  isVisible: (panelName) ->
    panels[panelName].isVisible()
