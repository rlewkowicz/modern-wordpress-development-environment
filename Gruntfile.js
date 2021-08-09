const { NONAME } = require("dns");

module.exports = function(grunt) {

    grunt.initConfig({
      // Watches for changes and runs tasks
      // Livereload is setup for the 35729 port by default
      watch: {
        sass: {
          files: ['/wordpress/wp-content/themes/twentynineteen/sass/**/*.scss', '/wordpress/wp-content/themes/twentynineteen/sass/*.scss'],
          tasks: ['exec:sass'],
          options: {
            livereload: 35729
          }
        },
        php: {
          files: ['/wordpress/wp-content/themes/twentynineteen/*.php'],
          options: {
            livereload: 35729
          }
        }
      },
      exec: {
          sass: {    
            cmd: 'sass --no-source-map style.scss style.css',
            cwd: '/wordpress/wp-content/themes/twentynineteen'
          }
      }
    });
  
    // Default task
    grunt.registerTask('default', ['watch']);
  
    // Load up tasks
    grunt.loadNpmTasks('grunt-exec');
    grunt.loadNpmTasks('grunt-contrib-watch');
  
  };