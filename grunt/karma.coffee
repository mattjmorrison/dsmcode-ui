module.exports =
  unit:
    options:
      basePath: '.'
      frameworks: ['qunit']
      files: [
        "build/deps*"
        "build/dsmcode*"
        "build/test_deps*"
        "tests/build/*.js"
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
        "build/dsmcode*.js": "coverage"
      coverageReporter:
        type: "lcov"
        dir: 'coverage/'
      plugins: [
          'karma-coverage'
          'karma-qunit'
          'karma-chrome-launcher'
          'karma-phantomjs-launcher'
      ]
