module.exports = function(config) {
  config.set({
    basePath: '.',
    frameworks: ['qunit'],
    files: [
        "src/lib/*.js",
        "bower_components/jquery-mockjax/jquery.mockjax.js",
        "src/*coffee",
        "src/templates/*handlebars",
        "tests/*coffee"
    ],
    reporters: ['progress'],
    port: 9876,
    runnerPort: 9100,
    colors: true,
    logLevel: config.LOG_INFO,
    browsers: ['Chrome'],
    captureTimeout: 60000,
    singleRun: true,
    autoWatch: false,
    plugins: [
        'karma-qunit',
        'karma-chrome-launcher',
        'karma-phantomjs-launcher',
        'karma-coffee-preprocessor',
        'karma-ember-preprocessor'
    ],
    preprocessors: {
        "**/*.coffee": 'coffee',
        "**/*.handlebars": 'ember'
    }
  });
};
