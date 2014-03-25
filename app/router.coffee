Router = Ember.Router.extend()

Router.map ->
  @resource "groups", path: '/', ->
    @resource "group", path: '/group/:id/'

`export default Router;`
