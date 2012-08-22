# nothing particularly new here, but this should not emit anything:

if $foo and $bar and $foo < $bar {
        notify { "test": }
}

# (it correctly emits nothing on telly)
