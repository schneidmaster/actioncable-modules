gulp    = require('gulp')
del     = require('del')
coffee  = require('gulp-coffee')

gulp.task 'clean', ->
  del(['dist/**/*'])

gulp.task 'coffee', ['clean'], ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee(bare: true))
    .pipe(gulp.dest('dist'))

gulp.task 'build', ['coffee']
