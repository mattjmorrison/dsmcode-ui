module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-ember-template-compiler'
  grunt.loadNpmTasks 'grunt-karma'

  grunt.initConfig
    karma:
      unit:
        configFile: 'karma.conf.js'
    connect:
      server:
        options:
          port: 9000
          base: '.'
          keepalive: true
    coffee:
      options:
        bare: true
      compile:
        files:
          'src/lib/app.min.js': 'src/*.coffee'
          'src/lib/tests.min.js': 'tests/*.coffee'
    emberhandlebars:
      compile:
        options:
          templateName: (sourceFile) ->
            newSource = sourceFile.replace 'src/templates/', ''
            newSource.replace '.handlebars', ''
        files: [
          'src/templates/*.handlebars'
        ]
        dest: 'src/lib/tmpl.min.js'
    concat:
      dist:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/handlebars/handlebars.js'
          'bower_components/ember/ember.min.js'
        ]
        dest: 'src/lib/deps.min.js'
      test:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/handlebars/handlebars.js'
          'bower_components/ember/ember.js'
        ]
        dest: 'src/lib/deps.min.js'

  grunt.task.registerTask 'builddist', ['concat:dist', 'coffee', 'emberhandlebars']
  grunt.task.registerTask 'buildtest', ['concat:test', 'coffee', 'emberhandlebars']
  grunt.task.registerTask 'local', ['builddist', 'connect']
  grunt.task.registerTask 'test', ['buildtest', 'karma']
