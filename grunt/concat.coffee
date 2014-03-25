module.exports =
  app:
    files:
      'build/tmp/deps.js': [
        'bower_components/jquery/jquery.min.js'
        'bower_components/handlebars/handlebars.js'
        'bower_components/ember/ember.js'
        'bower_components/ember-data/ember-data.min.js'
        'bower_components/bootstrap/js/collapse.js'
        'bower_components/bootstrap/js/dropdown.js'
      ]
      'build/tmp/dsmcode.js': [
        'loader.js'
        'ember-resolver.js'
        'build/tmp/transpiled/**/*.js'
        'build/tmp/templates.js'
      ]
      'build/app.js': ['build/tmp/deps.js', 'build/tmp/dsmcode.js']
  test:
    files:
      'build/test/deps.js': [
        'build/tmp/deps.js'
        'bower_components/jquery-mockjax/jquery.mockjax.js'
      ]
      'build/test/app.js': [
        'build/tmp/dsmcode.js'
      ]
      'build/test/tests.js': [
        'build/tmp/tests.js'
      ]
  mock:
    src: ['build/app.js', 'build/tmp/mocks.js']
    dest: 'build/demo/mocked_app.js'
  fixture:
    src: ['build/app.js', 'build/tmp/fixtures.js']
    dest: 'build/demo/fixture_app.js'
