# @summary 
#    Ensure TCP Wrappers is installed (Scored)
#
# TCP Wrappers provides a simple access list and standardized logging method for services capable of supporting 
## it. In the past, services that were called from inetd and xinetd supported the use of tcp wrappers. As inetd 
# and xinetd have been falling in disuse, any service that can support tcp wrappers will have the libwrap.so 
# library attached to it.
# 
# Rationale:
# TCP Wrappers provide a good simple access list mechanism to services that may not have that support built in. 
# It is recommended that all services that can support TCP Wrappers, use it.
#
# @param enforce
#    Enforce the rule or just test and log
#
# @param message
#    Message to print into the log
#
# @param loglevel
#    The loglevel for the above message
#
# @example
#   class security_baseline::rules::sec_tcp_wrappers {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_tcp_wrappers (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    package { 'tcp_wrappers':
      ensure => installed,
    }

  } else {

    if($::tcp_wrappers_pkg) {

      notify { 'tcp-wrappers':
        message  => $message,
        loglevel => $loglevel,
      }

    }

  }
}
