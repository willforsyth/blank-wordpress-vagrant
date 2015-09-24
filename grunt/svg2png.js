module.exports = {
    dist: {
        files: [{
            expand: true,
            cwd: 'dev/_assets/svg/',
            src: ['*.svg', '!_*.svg'],
            dest: 'web/themes/blank/assets/imgs/sprite/',
            rename: function(dest, src) {
                return dest + "icon-sprite.svg.icon__" + src.replace(/\.svg$/, ".png");
            }
        }]
    }
};