module.exports = {
    dev: {
	options: {
            style: 'expanded'
        },
        files: [{
            expand: true,
            cwd: 'dev/_assets/scss',
            src: '*.scss',
            dest: 'web/themes/blank/assets/css',
            ext: '.css'
        }]
    }
};
