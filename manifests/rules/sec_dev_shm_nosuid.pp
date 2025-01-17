# @summary 
#    Ensure nosuid option set on /dev/shm partition (Scored)
#
# The nosuid mount option specifies that the filesystem cannot contain setuid files.
#
# Rationale:
# Setting this option on a file system prevents users from introducing privileged programs onto 
# the system and allowing non-root users to execute them.
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
#   class security_baseline::rules::sec_dev_shm_nosuid {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_dev_shm_nosuid (
  $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if $enforce {

    # COuld we be using a resource for these instead of custom facts?
    if $::dev_shm_partition {

      if $::dev_shm_nosuid == false {
        notify { 'dev-shm-nosuid':
          message  => $message,
          loglevel => $loglevel,
        }
      }
    }
  }
}
