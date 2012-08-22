# from pvande - shows string comparisons between
# setting things to 'undef' have equality to both
# variables never set and to empty strings.

$y = undef

notice($y == "")  # true
notice($x == $y)  # true
notice($x == "")  # true
