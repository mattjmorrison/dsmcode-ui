DSMCode = Ember.Application.create
  rootElement: '#ember-app'

DSMCode.Store = DS.Store.extend
  adapter: 'DS.FixtureAdapter'

DSMCode.Router.map ->
  @resource "groups", path: '/'

DSMCode.Group = DS.Model.extend
  name: DS.attr 'string'

DSMCode.GroupsRoute = Ember.Route.extend
  model: ->
    DSMCode.Group.find()
  someDummy: ->
    console.log "this is untested code"

DSMCode.Group.FIXTURES = [
  {id: 1, name: "Group One"}
  {id: 2, name: "Group Two"}
]

