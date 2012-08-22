# the original bug was that ` 'undef == '' ` evaluated to true
# but ` '' == undef ` did not. which is seriously messed-up.
# jmccune wrote up a good set of test cases to step through this.
# The topic branched off into 14654, and there's a parting shot
# from Erik Dalén that fixing this correctly would mean that NEITHER
# of these things should be true, from a language correctness standpoint.

notify { 'one': }
notify { 'two': }

$notify_one = Notify[one]
$notify_two = Notify[two]

if undef == undef {
      notice("undef == undef")
}
if undef == '' {
      notice("undef == ''")
}
if '' == undef {
      notice("'' == undef")
}

if $notify_one == $notify_two {
      notice('$notify_one == $notify_two')
}
if $notify_one != $notify_two {
      notice('$notify_one != $notify_two')
}

if $notify_two == $notify_one {
      notice('$notify_two == $notify_one')
}
if $notify_two != $notify_one {
      notice('$notify_two != $notify_one')
}

if true == false {
      notice('true == false')
}
if false == true {
      notice('false == true')
}
if true != false {
      notice('true != false')
}
if false != true {
      notice('false != true')
}
