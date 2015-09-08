gulp = require 'gulp'
del = require 'del'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
nodemon = require 'gulp-nodemon'

gulp.task 'clean', ->
  del.sync [ 'build' ]

gulp.task 'coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee({bare: true})
    .on('error', gutil.log))
    .pipe(gulp.dest('build'))

gulp.task 'nodemon', ['coffee'], ->
  nodemon
    script: 'build/server.js'
    ext: 'js'
    env: 'NODE_ENV': 'development'

gulp.task 'watch:coffee', ->
  gulp.watch 'src/**/*.coffee', ['coffee']

# TODO: refactor with watch
gulp.task 'build', [
  'clean'
  'coffee'
]

# TODO: refactor with watch
gulp.task 'watch', [
  'clean'
  'watch:coffee'
  'nodemon'
]

gulp.task 'default', [
  'watch'
]
