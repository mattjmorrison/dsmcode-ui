module.exports = (grunt) ->

  grunt.task.registerTask 'app', [
    'coffee', 'emberhandlebars', 'concat:app'
  ]

