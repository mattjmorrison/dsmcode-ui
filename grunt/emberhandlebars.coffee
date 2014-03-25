module.exports =
  compile:
    options:
      templateName: (sourceFile) ->
        newSource = sourceFile.replace 'app/templates/', ''
        newSource.replace '.handlebars', ''
    files: ['app/templates/*.handlebars']
    dest: 'build/tmp/templates.js'
