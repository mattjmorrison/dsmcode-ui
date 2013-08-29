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

DSMCode.GroupController = Ember.ObjectController.extend
  twitter_url: Ember.computed(->
    "http://twitter.com/#{@get('twitter_handle')}"
  ).property('twitter_handle')

  google_group_url: Ember.computed(->
    "https://groups.google.com/forum/#!/forum/#{@get('google_group')}"
  ).property('google_group')

DSMCode.Group = DS.Model.extend
  name: DS.attr 'string'
  website: DS.attr 'string'
  twitter_handle: DS.attr 'string'
  google_group: DS.attr 'string'
  facebook: DS.attr 'string'
  tweets: DS.hasMany 'DSMCode.Tweet'
  posts: DS.hasMany 'DSMCode.Post'

DSMCode.Tweet = DS.Model.extend
  content: DS.attr 'string'
  group: DS.belongsTo 'DSMCode.Group'

DSMCode.Post = DS.Model.extend
  title: DS.attr 'string'
  group: DS.belongsTo 'DSMCode.Group'

DSMCode.Store = DS.Store.extend()
