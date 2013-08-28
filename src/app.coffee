DSMCode = Ember.Application.create
  rootElement: '#ember-app'

DSMCode.Router.map ->
  @resource "groups", path: '/', ->
    @resource "group", path: '/group/:id/'

DSMCode.GroupsRoute = Ember.Route.extend
  model: ->
    DSMCode.Group.find()

DSMCode.GroupRoute = Ember.Route.extend
  model: (params) ->
    DSMCode.Group.find(params.id)

DSMCode.Group = DS.Model.extend
  name: DS.attr 'string'
  tweets: DS.hasMany 'DSMCode.Tweet'
  posts: DS.hasMany 'DSMCode.Post'

DSMCode.Tweet = DS.Model.extend
  content: DS.attr 'string'
  group: DS.belongsTo 'DSMCode.Group'

DSMCode.Post = DS.Model.extend
  title: DS.attr 'string'
  group: DS.belongsTo 'DSMCode.Group'

DSMCode.Store = DS.Store.extend()
