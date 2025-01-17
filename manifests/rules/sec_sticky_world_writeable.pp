# @summary 
#    Ensure sticky bit is set on all world-writable directories (Scored)
#
# Setting the sticky bit on world writable directories prevents users from deleting or renaming files in 
# that directory that are not owned by them.
#
# Rationale:
# This feature prevents the ability to delete or rename files in world writable directories (such as /tmp ) 
# that are owned by another user.
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
#   class security_baseline::rules::sec_sticky_world_writeable {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_sticky_world_writeable (
  $enforce = true,
  String $message = '',
  String $loglevel = ''
) {

  if $::sticky_ww {

    if $enforce {
      # This is not idempotent, will run every time
      exec { "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t":#lint:ignore:140chars
          path => '/bin/',
        }

    } else {

      notify { 'sticky-ww':
        message  => $message,
        loglevel => $loglevel,
      }

    }
  }
}
