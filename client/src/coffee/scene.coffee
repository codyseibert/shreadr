_ = require 'underscore'

module.exports =
  class Scene

    constructor: ->
      #TODO: Make this private
      @entities = []

    add: (entity) ->
      @entities.push entity

    remove: (entity) ->
      index = _.findIndex @entities, (e) ->
        e.id is entity.id
      @entities.splice index, 1

    clear: ->
      @entities = []

    apply: (fn) ->
      _.each @entities, (entity) -> fn entity

    update: (delta) ->
      _.each @entities, (entity) -> entity.update delta

    render: (renderer) ->
      _.each @entities, (entity) -> entity.render renderer
