module.exports =
  options:
    spawn: false
    livereload: true
  sources:
    files: [
      'app/**'
      'index.html'
      'Gruntfile.coffee'
      'grunt/*.coffee'
    ]
    tasks: ['build:demo']
