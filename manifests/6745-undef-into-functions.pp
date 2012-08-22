# this bug is specifically about passing falsey things
# into parser functions and seeing their Class not be 'nil'
# as Ruby-savvy people would expect.

# it makes use of a simple parser function which just returns
# the 'arg.class.to_s' for an argument given to it.

$type1 = vmw_type("") # this func returns foo.class.to_s
notice("string is $type1")

$array = ["a", "b"]
$type2 = vmw_type($array)
notice("array is $type2")

$dict = { "key" => "value" }
$type3 = vmw_type($dict)
notice("dict is $type3")

$bool = true
$type5 = vmw_type($bool)
notice("true is $type5")

# this last one is surprising.

$undef = undef
$type4 = vmw_type($undef)
notice("undef is $type4")

#output:
# Scope(Class[main]): string is String
# Scope(Class[main]): array is Array
# Scope(Class[main]): dict is Hash
# Scope(Class[main]): true is TrueClass
# Scope(Class[main]): undef is String
