document.write '
<div id="ember-app"></div>
<div id="ember-testing-container">
  <div id="ember-testing"></div>
</div>'
Ember.testing = true
DSMCode.rootElement = '#ember-testing'
DSMCode.setupForTesting()
DSMCode.injectTestHelpers()

$.mockjaxSettings.logging = false
$.mockjaxSettings.responseTime = 0

stub_ajax = (verb, url, json, status=200) ->
  $.mockjax
    type: verb
    url: url
    status: status
    dataType: "json"
    responseText: json
