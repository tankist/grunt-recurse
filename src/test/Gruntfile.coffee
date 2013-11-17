module.exports = (grunt)->
    # grunt.Config behaves almost exactly like grunt.initConfig(), except:
    # Targets in multitasks are merged
    # If a Gruntfile loaded later defines the same multitask target, the
    # target is overwritten.
    grunt.Config =
        testMulti:
            base:
                foo: 'bar'
        copy:
            test:
                files:
                    'src/test/copy/b': ['src/test/copy/a']

    # The equal operator is overloaded to be array concatenation. The
    # right hand side can be either a string or array of strings.
    # Note, however, that all `grunt-*` tasks in node_modues will be
    # loaded by grunt-recurse automatically.
    # TODO rework this to use a non-NPM task list.
    # TODO add grunt.Tasks = '' to load local tasks.
    # grunt.NpmTasks = 'grunt-contrib-copy'

    grunt.registerTask 'testTask', ['testMulti:base', 'copy:test']

    grunt.registerMultiTask 'testMulti', 'Demonstrate grunt-recurse grunt.Config assigns correctly.', ->
        if this.data.foo isnt 'bar'
            throw 'Config data not received.'
