document.write '
<div id="ember-app"></div>
<div id="ember-testing-container">
  <div id="ember-testing"></div>
</div>'
Ember.testing = true
DSMCode.rootElement = '#ember-testing'
DSMCode.setupForTesting()
DSMCode.injectTestHelpers()
