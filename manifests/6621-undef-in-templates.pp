# 6621 is from oliver hookins, who wanted a way to express the
# equivalent of ruby 'nil' in puppet dsl.

# stefan schulte made a nice define exercising various options in the language
# there is also some talk of  undef variables going to and from templates, so
# modified it to include these cases into and out of ERB:
define test($var = undef) {
  if $var {
    notice "$name is true"
  }
  else {
    notice "$name is false"
  }
  notice inline_template("erb <%= name %> value: <%= var %>, is_a <%= var.class %>, boolean <% if var %>true<% else %>false<%end%>")
}

test { "empty string"  : var => "" }
test { "unquoted nil"  : var => nil }
test { "quoted nil"    : var => "nil"}
test { "quoted undef"  : var => "undef" }
test { "unquoted undef": }

# this produces, on 3.0:
# Scope(Test[empty string]): empty string is false
# Scope(Test[empty string]): erb empty string value: , is_a String, boolean true
# Scope(Test[unquoted nil]): unquoted nil is true
# Scope(Test[unquoted nil]): erb unquoted nil value: nil, is_a String, boolean true
# Scope(Test[quoted nil]): quoted nil is true
# Scope(Test[quoted nil]): erb quoted nil value: nil, is_a String, boolean true
# Scope(Test[quoted undef]): quoted undef is true
# Scope(Test[quoted undef]): erb quoted undef value: undef, is_a String, boolean true
# Scope(Test[unquoted undef]): unquoted undef is false
# Scope(Test[unquoted undef]): erb unquoted undef value: undef, is_a Symbol, boolean true
 
