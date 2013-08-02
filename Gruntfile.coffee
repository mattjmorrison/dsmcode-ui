module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.initConfig
    connect:
      server:
        options:
          port: 9000
          base: '.'
          keepalive: true
    concat:
      dist:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/handlebars/handlebar.js'
          'bower_components/ember/ember.min.js'
        ]
        dest: 'lib/app.min.js'

  grunt.task.registerTask 'local', ['concat', 'connect']
