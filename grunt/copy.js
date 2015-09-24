module.exports = {
    scripts: {
        files: [{
            expand: true,
            dot: true,
            cwd: 'dev/_assets/',
            dest: 'web/themes/blank/assets',
            src: 'scripts/{,*/}*.js'
        }]
    },
    images: {
        files: [{
            expand: true,
            dot: true,
            cwd: 'dev/_assets/',
            dest: 'web/themes/blank/assets',
            src: 'imgs/{,*/}*.{png,jpg,jpeg,gif,svg}'
        }]
    },
    fonts: {
        files: [{
            expand: true,
            dot: true,
            cwd: 'dev/_assets/',
            dest: 'web/themes/blank/assets',
            src: 'fonts/{,*/}*.{eot,svg,ttf,woff,woff2}'
        }]
    }
    // ,
    // dist:{
    //     files: [{
    //         expand: true,
    //         dot: true,
    //         cwd: 'dev/_assets/',
    //         dest: 'web',
    //         src: ['imgs/{,*/}*.{png,jpg,jpeg,gif,svg}']
    //     },
    //     {
    //         expand: true,
    //         dot: true,
    //         cwd: 'dev/_assets/',
    //         dest: 'web',
    //         src: 'fonts/{,*/}*.{eot,svg,ttf,woff,woff2}'
    //     },{
    //         expand: true,
    //         dot: true,
    //         cwd: 'bower_components/svg4everybody',
    //         dest: 'web/resources/scripts/vendor',
    //         src: 'svg4everybody.js'
    //     },{
    //         expand: true,
    //         dot: true,
    //         cwd: 'bower_components/zeroclipboard/dist',
    //         dest: 'web/scripts',
    //         src: '*.swf'
    //     }]
    // }
};