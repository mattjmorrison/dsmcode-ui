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
        'karma-chrome-launcher'
    ]
  });
};
