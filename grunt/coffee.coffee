module.exports =
  options:
    bare: true
  compile:
    files:
      'build/tmp/app.js': [
        'src/**/*.coffee'
      ],
      'build/tmp/fixtures.js': 'local/fixture_data.coffee',
      'build/tmp/mocks.js': 'local/mock_data.coffee',
      'build/tmp/tests.js': [
         'tests/helper.coffee',
         'tests/*tests.coffee'
      ]
