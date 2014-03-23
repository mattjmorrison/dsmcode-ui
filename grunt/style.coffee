module.exports = (grunt) ->

  grunt.task.registerTask 'style', ['less', 'cssmin']
