DSMCode = Ember.Application.create
  rootElement: '#ember-app'

DSMCode.Store = DS.Store.extend
  adapter: 'DS.FixtureAdapter'

DSMCode.Router.map (match) ->
  @resource "group",
    path: '/'

DSMCode.GroupRoute = Ember.Route.extend
  model: (params) ->
    console.log DSMCode.Group.all()
    DSMCode.Group.all()

DSMCode.GroupController = Ember.ArrayController.extend
  content: []

DSMCode.Group = DS.Model.extend
  name: DS.attr 'string'

DSMCode.Group.FIXTURES = [
  {id: 1, name: "Group One"}
  {id: 2, name: "Group Two"}
]
