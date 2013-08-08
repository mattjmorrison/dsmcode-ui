module 'DSMCodeTests',
  setup: ->
    DSMCode.reset()

test "shows correct title", ->

  visit('/').then ->
    value = find('h1').text()
    equal value, 'DesMoinesCode.com', "#{value} is wrong"

test "shows list of user groups", ->

  visit('/').then ->
    expected = [ { name: "Group One", }, { name: "Group Two", }, ]
    stub_ajax 'GET', '/group/', expected

    for group, index in expected
      group_one  = find(".groups li:eq(#{index})").text()
      equal group_one, group.name, "#{group} is wrong"

