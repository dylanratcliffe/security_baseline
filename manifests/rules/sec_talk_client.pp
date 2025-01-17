# @summary 
#    Ensure talk client is not installed (Scored)
#
# The talk software makes it possible for users to send and receive messages across systems 
# through a terminal session. The talk client, which allows initialization of talk sessions, 
# is installed by default.
# 
# Rationale:
# The software presents a security risk as it uses unencrypted protocols for communication.
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
#   class security_baseline::rules::sec_talk_client {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_talk_client (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    package { 'talk':
      ensure => purged,
    }

  } else {

    if($::mcstrans_pkg) {

      notify { 'talk-client':
        message  => $message,
        loglevel => $loglevel,
      }

    }

  }
}
