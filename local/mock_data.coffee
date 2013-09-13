group_one =
  id: 1
  name: "Group One"
  twitter_handle: 'group_one'
  website: 'http://groupone.com'
  facebook: 'http://facebook.com/groupone'
  google_group: 'group_one'
  tweets: [1, 2]
  posts: [1, 2]

group_two =
  id: 2
  name: "Group Two"
  tweets: [3, 4]
  posts: [3, 4]

jQuery.mockjax
  type: 'GET'
  url: '/groups'
  status: 200
  dataType: 'json'
  responseText:
    groups: [ group_one, group_two ]

jQuery.mockjax
  type: 'GET'
  url: '/groups/1'
  status: 200
  dataType: 'json'
  responseText:
    group_one

jQuery.mockjax
  type: 'GET'
  url: '/groups/2'
  status: 200
  dataType: 'json'
  responseText:
    group_two

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
