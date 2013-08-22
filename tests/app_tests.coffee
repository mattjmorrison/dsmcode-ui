module 'DSMCodeTests',
  setup: ->
    DSMCode.reset()

test "shows correct title", ->

  visit('/').then ->
    value = find('h1').text()
    equal value, 'DesMoinesCode.com', "#{value} is wrong"

test "shows list of user groups", ->

  expected = [
    { id: 1, name: "Group One", },
    { id: 2, name: "Group Two", },
    { id: 3, name: "Group Three"}]

  visit('/').then ->
    for group, index in expected
      group_one  = find(".groups li:eq(#{index})").text()
      equal group_one, group.name, "#{group} is wrong"

test "shows tweets on group details page", ->

  expected =
    tweets: [
      { content: "tweet one", group_id: 1},
      { content: "tweet two", group_id: 1},
    ]

  visit('/group/1/').then ->

    for tweet, index in expected.tweets
      content = find(".tweets li:eq(#{index})").text()
      equal content, tweet.content, "#{tweet.content} is wrong"
