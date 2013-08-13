module.exports = function(config) {
  config.set({
    basePath: '.',
    frameworks: ['qunit'],
    files: [
        "src/lib/deps.min.js",
        "src/lib/app.min.js",
        "src/lib/tmpl.min.js",
        "src/lib/tests.min.js"
    ],
    reporters: ['coverage', 'progress'],
    port: 9876,
    runnerPort: 9100,
    colors: true,
    logLevel: config.LOG_INFO,
    browsers: ['PhantomJS'],
    captureTimeout: 60000,
    singleRun: true,
    autoWatch: false,
    preprocessors: {
        "**/lib/app.min.js": "coverage"
    },
    coverageReporter: {
        type: "lcov",
        dir: "coverage/"
    },
    plugins: [
        'karma-qunit',
        'karma-coverage',
        'karma-chrome-launcher',
        'karma-phantomjs-launcher'
    ]
  });
};
