# @summary 
#    Ensure rsh client is not installed (Scored)
#
# The rsh package contains the client commands for the rsh services.
#
# Rationale:
# These legacy clients contain numerous security exposures and have been replaced with the more 
# secure SSH package. Even if the server is removed, it is best to ensure the clients are also 
# removed to prevent users from inadvertently attempting to use these commands and therefore 
# exposing their credentials. Note that removing the rsh package removes the clients for rsh , 
# rcp and rlogin .
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
#   class security_baseline::rules::sec_rsh_client {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_rsh_client (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    package { 'rsh':
      ensure => purged,
    }

  } else {

    if($::rsh_pkg) {

      notify { 'rsh-client':
        message  => $message,
        loglevel => $loglevel,
      }

    }

  }
}
