
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
