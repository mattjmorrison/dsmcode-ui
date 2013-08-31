jQuery.mockjax
  type: 'GET'
  url: '/groups'
  status: 200
  dataType: 'json'
  responseText:
    groups: [
      { id: 1, name: "Group One" }
      { id: 2, name: "Group Two" }
    ]

jQuery.mockjax
  type: 'GET'
  url: '/groups/1'
  status: 200
  dataType: 'json'
  responseText:
    group:
      id: 1
      name: "Group One"
      twitter_handle: 'group_one'
      website: 'http://groupone.com'
      facebook: 'http://facebook.com/groupone'
      google_group: 'group_one'
      tweet_ids: [1, 2]
      post_ids: [1, 2]

jQuery.mockjax
  type: 'GET'
  url: '/groups/2'
  status: 200
  dataType: 'json'
  responseText:
    group:
      id: 2
      name: "Group Two"
      tweet_ids: [3, 4]
      post_ids: [3, 4]

jQuery.mockjax
  type: 'GET'
  url:  '/tweets'
  data:
    ids: [1, 2]
  status: 200
  dataType: 'json'
  responseText:
    tweets: [
      {id: 1, content: 'tweet one'}
      {id: 2, content: 'tweet two'}
    ]

jQuery.mockjax
  type: 'GET'
  url:  '/tweets'
  data:
    ids: [3, 4]
  status: 200
  dataType: 'json'
  responseText:
    tweets: [
      {id: 3, content: 'tweet three'}
      {id: 4, content: 'tweet four'}
    ]

jQuery.mockjax
  type: 'GET'
  url: '/posts'
  data:
    ids: [1, 2]
  status: 200
  dataType: 'json'
  responseText:
    posts: [
      { id: 1, title: "message one" }
      { id: 2, title: "message two" }
    ]

jQuery.mockjax
  type: 'GET'
  url: '/posts'
  data:
    ids: [3, 4]
  status: 200
  dataType: 'json'
  responseText:
    posts: [
      { id: 3, title: "message three" }
      { id: 4, title: "message four" }
    ]
