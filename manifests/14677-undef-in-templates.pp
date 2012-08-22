# focused bug by jmccune on undef-in-templates 
# Assertion: "the expected behaviour is that we receive nil for the
# undefined variable, the same as for a variable that's never
# been defined."

# note this requires the 'pry' gem, which appears to kick major ass.

$undefined = undef
$foo = inline_template("<% require 'pry'; binding.pry; vapid_var; %>")
#[7] pry(#)> scope.lookupvar('undefined_no_really')
#=> nil
#[8] pry(#)> scope.lookupvar('undefined')
#=> :undef
