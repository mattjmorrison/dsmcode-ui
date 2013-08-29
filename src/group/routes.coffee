
DSMCode.GroupsRoute = Ember.Route.extend
  model: ->
    DSMCode.Group.find()


DSMCode.GroupRoute = Ember.Route.extend
  model: (params) ->
    DSMCode.Group.find(params.id)
