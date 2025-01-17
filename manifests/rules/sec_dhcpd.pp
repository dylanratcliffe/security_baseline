# @summary 
#    Ensure DHCP Server is not enabled (Scored)
#
# The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses.
#
# Rationale:
# Unless a system is specifically set up to act as a DHCP server, it is recommended that this service be disabled 
# to reduce the potential attack surface.
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
#   class security_baseline::rules::sec_dhcpd {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_dhcpd (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    service {'dhcpd':
      ensure => 'stopped',
      enable => false
    }

  } else {

    # Once again we could be using noop here
    if($::srv_dhcpd == 'enabled') {
      notify { 'dhcpd':
        message  => $message,
        loglevel => $loglevel,
      }
    }
  }
}
