module.exports = {
    compile: {
        options: {
            templateName: function(sourceFile){
                var newSource = sourceFile.replace('src/templates/', '');
                return newSource.replace('.handlebars', '');
            }
        },
        files: [
            'src/templates/*.handlebars'
        ],
        dest: 'build/tmpl.js'
    }
};
