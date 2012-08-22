# Prior to 2.6.2, passing a never-set variable into
# a parser function caused (in an unintended side-effedt)
# the variable to be assigned the internal symbol :undef

$is_set = "Yes this is set"

$array = split($is_set, ' ')
notice("is_set split on spaces: ${array[0]}")

# This behaves correctly on 3.0 and should not regress!
$empty_array = split($is_not_set, ' ')
notice("is_not_set split on spaces: ${empty_array[0]}")


