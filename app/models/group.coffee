Group = DS.Model.extend
  name: DS.attr 'string'
  website: DS.attr 'string'
  twitter_handle: DS.attr 'string'
  google_group: DS.attr 'string'
  facebook: DS.attr 'string'
  tweets: DS.hasMany 'tweet', async: true
  posts: DS.hasMany 'post', async: true

`export default Group;`
