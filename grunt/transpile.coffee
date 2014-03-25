module.exports =
  app:
    type: 'amd'
    moduleName: (path) ->
      'dsmcode' + path
    files: [{
      expand: true,
      cwd: 'build/tmp/es6/app',
      src: '**/*.js',
      dest: 'build/tmp/transpiled'
    }]
