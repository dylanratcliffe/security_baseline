# @summary 
#    Ensure separate partition exists for /home (Scored)
#
# The /home directory is used to support disk storage needs of local users. 
#
# Rationale:
# If the system is intended to support local users, create a separate partition for the /home directory 
# to protect against resource exhaustion and restrict the type of files that can be stored under /home.
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
#   class security_baseline::rules::sec_home_partition {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_home_partition (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {

  if($enforce) {
    if $::home_partition == undef {

      notify { 'home-partition':
        message  => $message,
        loglevel => $loglevel,
        }
      }
  }

}
