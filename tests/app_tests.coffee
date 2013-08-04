module 'DSMCodeTests',
  setup: ->
    DSMCode.reset()

test "first real test", ->

  visit('/').then ->
    value = find('h1').text()
    equal value, 'Hello World', "#{value} is wrong"
