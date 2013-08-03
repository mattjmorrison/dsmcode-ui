module 'DSMCodeTests',
  setup: ->
    DSMCode.reset()

test "first real test", ->

  visit('/').then ->
    value = find('h3').text()
    equal(value, 'Hello World', '')
