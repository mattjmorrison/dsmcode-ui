module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-ember-template-compiler'
  grunt.loadNpmTasks 'grunt-karma-coveralls'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.initConfig
    karma:
      unit:
        configFile: 'karma.conf.js'
    coveralls:
      options:
        repo_token: 'dkh51YHpiC1gRPUb8KSUg5jJOSX7A7Kna'
        service_name: 'travis-ci'
        coverage_dir: 'coverage'
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
    coffeelint:
      app: ["src/*.coffee"]
    concat:
      dist:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/handlebars/handlebars.js'
          'bower_components/ember/ember.min.js'
          'src/ember-data-0.13.min.js'
        ]
        dest: 'src/lib/deps.min.js'
      test:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/handlebars/handlebars.js'
          'bower_components/ember/ember.js'
          'src/ember-data-0.13.min.js'
          'bower_components/jquery-mockjax/jquery.mockjax.js'
        ]
        dest: 'src/lib/deps.min.js'

  grunt.task.registerTask 'builddist', ['concat:dist', 'coffee', 'emberhandlebars']
  grunt.task.registerTask 'buildtest', ['concat:test', 'coffee', 'emberhandlebars']
  grunt.task.registerTask 'local', ['builddist', 'connect']
  grunt.task.registerTask 'test', ['buildtest', 'karma']
  grunt.task.registerTask 'travis', ['test', 'coffeelint', 'coveralls']
