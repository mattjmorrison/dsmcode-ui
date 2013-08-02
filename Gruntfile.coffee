module.exports = (grunt) ->

  grunt.initConfig
    connect:
      server:
        options:
          port: 9000
          base: '.'
          keepalive: true

  grunt.loadNpmTasks 'grunt-contrib-connect'
