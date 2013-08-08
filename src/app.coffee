DSMCode = Ember.Application.create
  rootElement: '#ember-app'

DSMCode.Store = DS.Store.extend
  revision: 12
  adapter: 'DS.fixtureAdapter'

DS.RESTAdapter.reopen
  url: '/'

DSMCode.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    console.log DSMCode.Group.all()
    controller.set 'groups', DSMCode.Group.all()

DSMCode.Router.map ->
  @resource "application",
    path: "/"

DSMCode.Group = DS.Model.extend
  name: DS.attr 'string'

DSMCode.Group.FIXTURES = [
  {id: 1, name: "Group One"}
  {id: 2, name: "Group Two"}
]
