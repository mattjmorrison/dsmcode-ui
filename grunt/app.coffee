module.exports = (grunt) ->

  grunt.task.registerTask 'app', [
    'coffee', 'transpile', 'emberhandlebars', 'concat:app'
  ]

