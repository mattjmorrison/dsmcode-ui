Route = Ember.Route.extend
  model: ->
    @store.find('group')

`export default Route;`
