module.exports = {
    options: {
        browsers: ['last 3 versions']
    },
    dev: {
        files: [{
            expand: true,
            cwd: 'web/css/',
            src: '*.css',
            dest: 'web/themes/blank/assets/css/'
        }]
    },
};
