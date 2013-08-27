module 'DSMCodeTests',
  setup: ->
    Ember.run ->
      DSMCode.reset()
      DSMCode.deferReadiness()

test "shows list of user groups", ->

  expected = [
    { id: 1, name: "Group One", },
    { id: 2, name: "Group Two", },
    { id: 3, name: "Group Three"}
  ]
  stub_ajax 'GET', '/groups',
    groups: expected

  Ember.run DSMCode, 'advanceReadiness'

  visit('/').then ->
    for group, index in expected
      group_one  = find(".groups li:eq(#{index})").text()
      equal group_one, group.name, "#{group_one} != #{group.name}"

test "shows correct title", ->
  stub_ajax 'GET', '/groups', []

  Ember.run DSMCode, 'advanceReadiness'

  visit('/').then ->
    value = find('h1').text()
    equal value, 'DesMoinesCode.com', "#{value} is wrong"
    value = find('.groups li:eq(0)').text()
    equal value, '', "Element should not have existed but was '#{value}'"

# test "shows tweets on group details page", ->

#   stub_ajax 'GET', '/groups', [
#     { id: 1, name: "Group One", },
#     { id: 2, name: "Group Two", },
#     { id: 3, name: "Group Three"}]

#   expected =
#     tweets: [
#       { content: "tweet one", group_id: 1},
#       { content: "tweet two", group_id: 1},
#     ]
#   stub_ajax 'GET', '/groups/1', expected

#   Ember.run DSMCode, 'advanceReadiness'

#   visit('/group/1/').then ->

#     for tweet, index in expected.tweets
#       content = find(".tweets li:eq(#{index})").text()
#       equal content, tweet.content, "#{tweet.content} != '#{content}'"
