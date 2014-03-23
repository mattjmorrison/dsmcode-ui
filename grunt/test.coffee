module.exports = (grunt) ->

  grunt.task.registerTask 'test:base', [
    'clean:build'
    'coffee'
    'emberhandlebars'
    'concat:app'
    'concat:test'
  ]

  grunt.task.registerTask 'test', [
    'test:base',
    'karma:local'
  ]

  grunt.task.registerTask 'test:ci', [
    'test:base',
    'karma:ci'
    'coveralls'
  ]
