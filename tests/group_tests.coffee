test "shows group website", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      website: 'http://groupone.com'

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    text = find(".website[href*='http://groupone.com']").text()
    equal text, "Website", "'#{text}' was website link text"

test "does not show website link when not configured", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      website: ''

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    equal 0, !!find(".website").length, "Website link should not have existed"

test "shows group twitter handle and url", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      twitter_handle: 'group_one'

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    text = find(".twitter[href*='http://twitter.com/group_one']").text()
    equal text, "group_one", "'#{text}' was twitter link text"

test "does not show twitter link when not configured", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      twitter: ''

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    equal 0, !!find(".twitter").length, "Twitter link should not have existed"

test "shows group google group link", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      google_group: 'group_one'

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    text = find(".google-group[href*='https://groups.google.com/forum/#!/forum/group_one']").text()
    equal text, "Google Group", "'#{text}' was google group link text"

test "does not show google group link when not configured", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      google_group: ''

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    equal 0, !!find(".google-group").length, "Google Group link should not have existed"

test "shows facebook link", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      facebook: 'http://facebook.com/group_one'

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    text = find(".facebook[href*='http://facebook.com/group_one']").text()
    equal text, "Facebook", "'#{text}' was facebook link text"

test "does not show facebook link when not configured", ->
  stub_ajax 'GET', '/groups', []
  stub_ajax 'GET', '/groups/1',
    group:
      id: 1
      facebook: ''

  Ember.run DSMCode, 'advanceReadiness'

  visit('/group/1/').then ->
    equal 0, !!find(".facebook").length, "facebook link should not have existed"
