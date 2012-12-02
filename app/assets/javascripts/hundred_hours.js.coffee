#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require_self

HundredHours.register = (label, callback) ->
  @fragments = @fragments || {}
  @fragments[label] = callback

HundredHours.require = (label, data) ->
  @fragments[label].call(window,data)
