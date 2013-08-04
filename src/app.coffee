DSMCode = Ember.Application.create
  rootElement: '#ember-app'

DSMCode.Router.map ->
  @resource "application",
    path: "/"
