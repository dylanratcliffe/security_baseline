# @summary 
#    Ensure Reverse Path Filtering is enabled (Scored)
#
# Setting net.ipv4.conf.all.rp_filter and net.ipv4.conf.default.rp_filter to 1 forces 
# the Linux kernel to utilize reverse path filtering on a received packet to determine 
# if the packet was valid. Essentially, with reverse path filtering, if the return packet 
# does not go out the same interface that the corresponding source packet came from, the 
# packet is dropped (and logged if log_martians is set).
#
# Rationale:
# Setting these flags is a good way to deter attackers from sending your system bogus packets 
# that cannot be responded to. One instance where this feature breaks down is if asymmetrical 
# routing is employed. This would occur when using dynamic routing protocols (bgp, ospf, etc) 
# on your system. If you are using asymmetrical routing on your system, you will not be able 
# to enable this feature without breaking the routing.
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
#   class security_baseline::rules::sec_network_reverse_path_filtering {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_network_reverse_path_filtering (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    sysctl {
      'net.ipv4.conf.all.rp_filter':
        value => 1;
      'net.ipv4.conf.default.rp_filter':
        value => 1;
    }

  } else {

    if(has_key($::network_parameters, 'net.ipv4.conf.all.rp_filter' )) {
      $fact = $::network_parameters['net.ipv4.conf.all.rp_filter']
    } else {
      $fact = ''
    }
    if(has_key($::network_parameters, 'net.ipv4.conf.default.rp_filter')) {
      $fact_default = $::network_parameters['net.ipv4.conf.default.rp_filter']
    } else {
      $fact_default = ''
    }
    if(($fact != '1') or ($fact_default != '1')) {
      notify { 'net.ipv4.conf.all.rp_filter':
        message  => $message,
        loglevel => $loglevel,
      }
    }
  }
}
