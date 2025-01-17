# @summary 
#    Ensure nodev option set on /home partition (Scored)
#
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# Rationale:
# Since the user partitions are not intended to support devices, set this option to ensure that users 
# cannot attempt to create block or character special devices.
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
#   class security_baseline::rules::sec_home_nodev {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_home_nodev (
  $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if $enforce {

    if $::home_partition {

      if $::home_nodev == false {
        notify { 'home-nodev':
          message  => $message,
          loglevel => $loglevel,
        }
      }
    }
  }
}
