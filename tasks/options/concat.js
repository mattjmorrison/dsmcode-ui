module.exports = {
    deps: {
        src: [
            'bower_components/jquery/jquery.min.js',
            'bower_components/handlebars/handlebars.js',
            'bower_components/ember/ember.js',
            'bower_components/ember-data-shim/ember-data.js',
            'bower_components/bootstrap/js/bootstrap-collapse.js',
            'bower_components/bootstrap/js/bootstrap-dropdown.js'
        ],
        dest: 'build/deps.js'
    },
    dsmcode: {
        src: [
            'build/app.js',
            'build/tmpl.js'
        ],
        dest: 'build/dsmcode.js'
    },
    test: {
        src: [
            'bower_components/jquery-mockjax/jquery.mockjax.js'
        ],
        dest: 'build/test_deps.js'
    }
};
