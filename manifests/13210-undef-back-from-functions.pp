# this behaves as expected on 3.x -- you get a duplicate definition
# error because both notifys end up being the same.

define foo ( $x = '1' ) {
      notify { "${title}-${x}": }
}

class bar {
      $x = myfunc( undef )
        foo {'no1': x=> $x }
}

class baz {
      $x = undef
        foo {'no2': x=> $x }
}

include bar
include baz
