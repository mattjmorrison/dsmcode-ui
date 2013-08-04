module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-ember-templates'
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
            sourceFile.replace 'src/templates/', ''
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


  grunt.task.registerTask 'emberhandlebars', 'Compile ember templates', ->

    glob = require 'glob'
    fs = require 'fs'
    mkdirp = require 'mkdirp'
    compiler = require 'ember-template-compiler'
    dirname = require('path').dirname

    files = grunt.config 'emberhandlebars.compile.files'
    dest = grunt.config 'emberhandlebars.compile.dest'
    formatName = grunt.config 'emberhandlebars.compile.options.templateName'

    output = ""
    files.forEach (pattern) ->
      for pathMatch in glob.sync pattern
        input = fs.readFileSync(pathMatch).toString()
        result = compiler.precompile(input).toString()
        templateName = formatName(pathMatch)
        output += "Ember.TEMPLATES['#{templateName}'] = Ember.Handlebars.template(#{result});"

    dirName = dirname(dest)
    mkdirp(dirName)
    fs.writeFileSync dest, output

  grunt.task.registerTask 'builddist', ['concat:dist', 'coffee', 'emberhandlebars']
  grunt.task.registerTask 'buildtest', ['concat:test', 'coffee', 'emberhandlebars']
  grunt.task.registerTask 'local', ['builddist', 'connect']
  grunt.task.registerTask 'test', ['buildtest', 'karma']
