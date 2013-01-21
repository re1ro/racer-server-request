module.exports = function (grunt) {
  "use strict";

  grunt.loadNpmTasks('grunt-bg-shell');


  // Project configuration.
  grunt.initConfig({

    bgShell: {
      coffeeCompile: {
        cmd: './node_modules/coffee-script/bin/coffee -b -o ./build -c ./src',
        stdout: true,
        stderr: true
      },
      coffeeWatch: {
        cmd: './node_modules/coffee-script/bin/coffee -bw -o ./build -c ./src',
        stdout: true,
        stderr: true
      }
    }
  });


  grunt.registerTask('default', 'bgShell:coffeeWatch');


};