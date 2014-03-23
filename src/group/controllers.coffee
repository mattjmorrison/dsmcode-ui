DSMCode.GroupController = Ember.ObjectController.extend
  twitter_url: Ember.computed(->
    "http://twitter.com/#{@get('twitter_handle')}"
  ).property('twitter_handle')

  google_group_url: Ember.computed(->
    "https://groups.google.com/forum/#!/forum/#{@get('google_group')}"
  ).property('google_group')
