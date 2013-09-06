module.exports = (grunt) ->

  grunt.initConfig
    karma:
      unit:
        configFile: 'karma.conf.js'
    coveralls:
      options:
        repo_token: 'nqyseqTpGOz9NFjRATCqx3N4VCcSGsvCk'
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
          'build/localdata.js': 'local/fixture_data.coffee'
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
          'bower_components/ember-data-shim/ember-data.js'
          'bower_components/bootstrap/js/bootstrap-collapse.js'
          'bower_components/bootstrap/js/bootstrap-dropdown.js'
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
    recess:
      options:
        compile: true
      bootstrap:
        src: [
          'bower_components/bootstrap/less/bootstrap.less'
          'bower_components/bootstrap/less/responsive.less'
        ]
        dest: 'build/css/bootstrap-responsive.min.css'

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-ember-template-compiler'
  grunt.loadNpmTasks 'grunt-karma-coveralls'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-recess'

  grunt.task.registerTask 'test', ['buildtest', 'karma']
  grunt.task.registerTask 'local', ['builddist', 'clean:local', 'concat:test', 'recess:bootstrap', 'connect']
  grunt.task.registerTask 'ci', ['test_coverage', 'test_uglified', 'coffeelint']

  grunt.task.registerTask 'basebuild', ['coffee', 'emberhandlebars', 'concat:dsmcode', 'concat:deps']
  grunt.task.registerTask 'builddist', ['clean:build', 'basebuild', 'uglify:deps', 'uglify:app']
  grunt.task.registerTask 'buildtest', ['clean:build', 'basebuild', 'concat:test']
  grunt.task.registerTask 'test_uglified', ['clean', 'builddist', 'concat:test', 'clean:ci', 'karma']
  grunt.task.registerTask 'test_coverage', ['test', 'coveralls']
