module.exports = function (grunt) {
  "use strict";

  grunt.loadNpmTasks('grunt-bg-shell');


  // Project configuration.
  grunt.initConfig({

    bgShell: {
      watchCoffee: {
        cmd: './node_modules/coffee-script/bin/coffee -bw -o ./build -c ./src'
      }
    }

  });


  grunt.registerTask('default', 'bgShell');


};