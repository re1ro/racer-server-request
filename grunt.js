module.exports = function (grunt) {
  "use strict";

  grunt.loadNpmTasks('grunt-shell');


  // Project configuration.
  grunt.initConfig({

    shell: {
      coffeeCompile: {
        command: './node_modules/coffee-script/bin/coffee -b -o ./build -c ./src',
        stdout : true,
        stderr : true
      },
      coffeeWatch  : {
        command: './node_modules/coffee-script/bin/coffee -bw -o ./build -c ./src',
        stdout : true,
        stderr : true
      }
    }
  });

  // Default task.

  grunt.registerTask('default', 'Compiling coffee', function () {
    // Force task into async mode and grab a handle to the "done" function.
    var done = this.async();
    // Run some sync stuff.

    grunt.task.run('shell:coffeeCompile');
    done();

  });

  grunt.registerTask('run', 'Watching coffee', function () {
    // Force task into async mode and grab a handle to the "done" function.
    var done = this.async();
    // Run some sync stuff.

    grunt.task.run('shell:coffeeWatch');
    done();

  });


};