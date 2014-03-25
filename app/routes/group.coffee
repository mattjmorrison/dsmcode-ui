Route = Ember.Route.extend
  model: (params) ->
    @store.find('group', params.id)

`export default Route;`
