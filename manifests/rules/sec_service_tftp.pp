# @summary 
#    Ensure tftp server is not enabled (Scored)
#
# Trivial File Transfer Protocol (TFTP) is a simple file transfer protocol, typically used to 
# automatically transfer configuration or boot machines from a boot server. The package 
# tftp-server is used to define and support a TFTP server.
#
# Rationale:
# TFTP does not support authentication nor does it ensure the confidentiality or integrity of 
# data. It is recommended that TFTP be removed, unless there is a specific need for TFTP. In 
# that case, extreme caution must be used when configuring the services.
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
#   class security_baseline::rules::sec_service_tftp {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_service_tftp (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    service { 'tftp-dgram':
      ensure => stopped,
      enable => false,
    }

    service { 'tftp-stream':
      ensure => stopped,
      enable => false,
    }

  } else {

    if($::srv_tftp == true) {

      notify { 'tftp-service':
        message  => $message,
        loglevel => $loglevel,
      }

    }
  }
}
