# @summary 
#    Ensure TCP SYN Cookies is enabled (Scored)
#
# When tcp_syncookies is set, the kernel will handle TCP SYN packets normally until the half-open 
# connection queue is full, at which time, the SYN cookie functionality kicks in. SYN cookies work 
# by not using the SYN queue at all. Instead, the kernel simply replies to the SYN with a SYN|ACK, 
# but will include a specially crafted TCP sequence number that encodes the source and destination 
# IP address and port number and the time the packet was sent. A legitimate connection would send 
# the ACK packet of the three way handshake with the specially crafted sequence number. This allows 
# the system to verify that it has received a valid response to a SYN cookie and allow the connection, 
# even though there is no corresponding SYN in the queue.
#
# Rationale:
# Attackers use SYN flood attacks to perform a denial of service attacked on a system by sending many 
# SYN packets without completing the three way handshake. This will quickly use up slots in the kernel's 
# half-open connection queue and prevent legitimate connections from succeeding. SYN cookies allow the 
# system to keep accepting valid connections, even if under a denial of service attack.
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
#   class security_baseline::rules::sec_network_tcp_syn_cookies {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_network_tcp_syn_cookies (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    sysctl {
      'net.ipv4.tcp_syncookies':
        value => 1
    }

  } else {

    if(has_key($::network_parameters, 'net.ipv4.tcp_syncookies')) {
      $fact = $::network_parameters['net.ipv4.tcp_syncookies']
    } else {
      $fact = ''
    }
    if($fact != '1') {
      notify { 'net.ipv4.tcp_syncookies':
        message  => $message,
        loglevel => $loglevel,
      }
    }
  }
}
