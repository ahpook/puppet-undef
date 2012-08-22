# this seems ... bad, but pretty edgy.
# more in the realm of moving from the DSL into Ruby.
# nigel suggests that 'nil?' and 'empty?' ought to work on undefined values

$my_array = [ $some_var, 'some value', ] 
file { "/tmp/test": 
    content => inline_template("<%= my_array.reject(&:empty?).each { |val| val } -%>") 
} 

