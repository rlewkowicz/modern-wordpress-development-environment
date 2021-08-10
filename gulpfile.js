var livereload = require('gulp-livereload');
const { series } = require('gulp');
var gulp = require('gulp');

function lr(cb) {
    livereload.reload("index.php")
    cb();
  }

function sass(cb) {
    const { execSync } = require('child_process');
    const stdout = execSync('bash -c "sass --no-source-map /wordpress/wp-content/themes/twentytwentyone/assets/sass/style.scss /wordpress/wp-content/themes/twentytwentyone/style.css"');
    cb();
  }

gulp.task('watch', function() {
    livereload.listen();
    gulp.watch('/wordpress/**/*.scss', {interval: 50, usePolling: true}, series(sass, lr));
  });

