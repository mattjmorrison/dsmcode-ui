
DSMCode.Store = DS.Store.extend
  adapter: 'DS.FixtureAdapter'

DSMCode.Group.FIXTURES = [
  {id: 1, name: "Group One", slug: 'one', tweets: [1, 2]}
  {id: 2, name: "Group Two", slug: 'two', tweets: [3, 4]}
  {id: 3, name: "Group Three", slug: 'three', tweets: [5, 6]}
]

DSMCode.Tweet.FIXTURES = [
  {id: 1, content: 'tweet one', group_id: 1}
  {id: 2, content: 'tweet two', group_id: 1}
  {id: 3, content: 'tweet three', group_id: 2}
  {id: 4, content: 'tweet four', group_id: 2}
  {id: 5, content: 'tweet five', group_id: 3}
  {id: 6, content: 'tweet six', group_id: 3}
]
