module.exports = {
    dist: {
        devFile: 'bower_components/modernizr/modernizr.js',
        outputFile: 'web/themes/blank/assets/scripts/vendor/modernizr.js',
        files: {
            src: [
                'web/themes/blank/assets/scripts/{,*/}*.js',
                'web/themes/blank/assets/styles/{,*/}*.css'
            ]
        },
        uglify: true
    }
};