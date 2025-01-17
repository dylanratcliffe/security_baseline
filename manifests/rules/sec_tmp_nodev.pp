# @summary 
#    Ensure nodev option set on /tmp partition (Scored)
#
# The nodev mount option specifies that the filesystem cannot contain special devices.
#
# Rationale:
# Since the /tmp filesystem is not intended to support devices, set this option to ensure that 
# users cannot attempt to create block or character special devices in /tmp .
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
#   class security_baseline::rules::sec_tmp_nodev {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_tmp_nodev (
  $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if $enforce {

    if $::tmp_partition {

      if $::tmp_nodev == false {
        notify { 'tmp-nodev':
          message  => $message,
          loglevel => $loglevel,
        }
      }
    }
  }
}
