module.exports = (grunt) ->

  grunt.initConfig require("load-grunt-config")(grunt)

  grunt.task.registerTask 'build:demo', [
    'clean:build', 'app', 'style', 'concat:fixture', # 'uglify:demo'
  ]

  grunt.task.registerTask 'build:prod', [
    'clean:build', 'app', 'style', 'uglify:demo'
  ]

  # grunt.task.registerTask 'ci', ['test_coverage', 'test_uglified', 'coffeelint']
  # grunt.task.registerTask 'test_coverage', ['test', 'coveralls']
