
DSMCode.Router.map ->
  @resource "groups", path: '/', ->
    @resource "group", path: '/group/:id/'
