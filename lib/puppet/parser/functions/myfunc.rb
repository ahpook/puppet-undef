#
# from 13210
#

module Puppet::Parser::Functions
    newfunction(:myfunc, :type => :rvalue) do |param|
      return param
    end
end
