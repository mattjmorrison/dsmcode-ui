`import Resolver from 'ember/resolver';`
`import Ember from 'ember'`

DSMCode = Application.extend
  rootElement: '#ember-app'
  Resolver: Resolver
  modulePrefix: 'dsmcode'
  LOG_ACTIVE_GENERATION: true
  LOG_MODULE_RESOLVER: true
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true

`export default DSMCode;`
