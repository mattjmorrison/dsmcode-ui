module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-ember-template-compiler'
  grunt.loadNpmTasks 'grunt-karma-coveralls'
  grunt.loadNpmTasks 'grunt-karma'

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
          'build/app.js': [
            'src/*.coffee'
            'src/**/*.coffee'
          ]
          'build/localdata.js': 'local/*.coffee'
          'tests/build/tests.js': [
             'tests/helper.coffee'
             'tests/*tests.coffee'
          ]
    emberhandlebars:
      compile:
        options:
          templateName: (sourceFile) ->
            newSource = sourceFile.replace 'src/templates/', ''
            newSource.replace '.handlebars', ''
        files: [
          'src/templates/*.handlebars'
        ]
        dest: 'build/tmpl.js'
    coffeelint:
      app: ["src/*.coffee"]
    concat:
      deps:
        src: [
          'bower_components/jquery/jquery.min.js'
          'bower_components/handlebars/handlebars.js'
          'bower_components/ember/ember.js'
          'src/ember-data-0.13.min.js'
        ]
        dest: 'build/deps.js'
      dsmcode:
        src: [
          'build/app.js'
          'build/tmpl.js'
        ]
        dest: 'build/dsmcode.js'
      test:
        src: [
          'bower_components/jquery-mockjax/jquery.mockjax.js'
        ]
        dest: 'build/test_deps.js'
    uglify:
      app:
        src: ['build/dsmcode.js']
        dest: 'build/dsmcode.min.js'
      deps:
        src: ['build/deps.js']
        dest: 'build/deps.min.js'
    clean:
      build: ['build', 'tests/build', 'coverage']
      local: [
        'build/app.js',
        'build/deps.js',
        'build/dsmcode.js',
        'build/tmpl.js'
      ]
      ci: [
        'build/app.js',
        'build/deps.js',
        'build/dsmcode.js',
        'build/localdata.js',
        'build/tmpl.js'
      ]

  grunt.task.registerTask 'basebuild', ['coffee', 'emberhandlebars', 'concat:dsmcode', 'concat:deps']
  grunt.task.registerTask 'builddist', ['basebuild', 'uglify:deps', 'uglify:app']
  grunt.task.registerTask 'buildtest', ['basebuild', 'concat:test']
  grunt.task.registerTask 'test', ['clean:build', 'buildtest', 'karma']
  grunt.task.registerTask 'local', ['clean:build', 'builddist', 'clean:local', 'concat:test', 'connect']
  grunt.task.registerTask 'ci', ['clean', 'builddist', 'concat:test', 'clean:ci', 'karma', 'coffeelint', 'coveralls']
