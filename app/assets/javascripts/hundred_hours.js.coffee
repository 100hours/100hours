#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes

# Our ember application
@HundredHours = Em.Application.create
  rootElement: "#viewer"

@HundredHours.Models = {}
@HundredHours.Views = {}

HundredHours.register = (label, callback) ->
  @fragments = @fragments || {}
  @fragments[label] = callback

HundredHours.require = (label, data) ->
  @fragments[label].call(window,data)

HundredHours.store = DS.Store.create
  adapter:  DS.RESTAdapter.create()
  revision: 8
window.HundredHours = HundredHours



