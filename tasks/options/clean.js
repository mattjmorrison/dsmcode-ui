module.exports = {
    build: [
        'build',
        'tests/build',
        'coverage'
    ],
    local: [
        'build/app.js',
        'build/deps.js',
        'build/dsmcode.js',
        'build/tmpl.js'
    ],
    ci: [
        'build/app.js',
        'build/deps.js',
        'build/dsmcode.js',
        'build/localdata.js',
        'build/tmpl.js'
    ]
};
