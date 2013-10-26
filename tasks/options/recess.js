module.exports = {
    options: {
        compile: true
    },
    bootstrap: {
        src: [
            'bower_components/bootstrap/less/bootstrap.less',
            'bower_components/bootstrap/less/responsive.less'
        ],
        dest: 'build/css/bootstrap-responsive.min.css'
    }
};
