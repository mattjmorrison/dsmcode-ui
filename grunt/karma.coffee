module.exports =
  options:
    basePath: '.'
    frameworks: ['qunit']
    files: [
      'build/test/deps.js'
      'build/test/app.js'
      'build/test/tests.js'
    ]
    port: 9876
    runnerPort: 9100
    colors: true
    browsers: ['PhantomJS']
    captureTimeout: 60000
    singleRun: true
    autoWatch: false
    reporters: ['coverage', 'progress']
    preprocessors:
      "build/test/app.js": "coverage"
      "build/test/tests.js": "coverage"
    coverageReporter:
      type: "text"
      dir: 'coverage/'
    plugins: [
      'karma-coverage'
      'karma-qunit'
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
    ]
  local:
    coverageReporter:
      type: "text"
      dir: 'coverage/'
  ci:
    coverageReporter:
      type: "lcov"
      dir: 'coverage/'
