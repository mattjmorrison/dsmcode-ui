module.exports =
  options:
    spawn: false
    livereload: true
  sources:
    files: [
      'src/**'
      'index.html'
      'Gruntfile.coffee'
      'grunt/*.coffee'
    ]
    tasks: ['build:demo']
