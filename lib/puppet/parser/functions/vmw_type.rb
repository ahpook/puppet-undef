#
# vmw_type.rb
# parser function to exercise #6745

module Puppet::Parser::Functions
  newfunction(:vmw_type, :type => :rvalue, :doc => <<-EOS
Returns the class of whatever argument is given to it.
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "vmw_type(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size != 1

    return arguments[0].class.to_s
  end
end

# vim: set ts=2 sw=2 et :
