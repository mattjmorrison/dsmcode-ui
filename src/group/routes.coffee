DSMCode.GroupsRoute = Ember.Route.extend
  model: ->
    @store.find('group')


DSMCode.GroupRoute = Ember.Route.extend
  model: (params) ->
    @store.find('group', params.id)
