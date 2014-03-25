`import DSMCode from 'dsmcode/app';`
`import Adapter from 'dsmcode/adapters/fixture';`
`import Group from 'dsmcode/models/group';`
`import Post from 'dsmcode/models/post';`
`import Tweet from 'dsmcode/models/tweet';`

App = DSMCode.create()
App.ApplicationAdapter = Adapter

Group.FIXTURES = [
  {
    id: 1
    name: 'Test Group'
    website: 'website'
    twitter_handle: 'twitter_handle'
    google_group: 'google_group_name'
    facebook: 'facebook_name'
    tweets: [1, 2]
    posts: [1, 2]
  },
  {
    id: 2
    name: 'Second Test Group'
    website: 'my website'
    twitter_handle: 'my twitter_handle'
    google_group: 'my google_group_name'
    facebook: 'my facebook_name'
    tweets: [3, 4]
    posts: [3, 4]
  }
]

Post.FIXTURES = [
  { id: 1, title: 'first post' }
  { id: 2, title: 'second post' }
  { id: 3, title: 'my first post' }
  { id: 4, title: 'my second post' }
]

Tweet.FIXTURES = [
  { id: 1, content: 'hello world' }
  { id: 2, content: 'hello again' }
  { id: 3, content: 'my hello again 1' }
  { id: 4, content: 'my hello again 2' }
]

`export default App;`
