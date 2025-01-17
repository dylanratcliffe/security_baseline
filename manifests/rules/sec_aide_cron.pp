# @summary 
#    Ensure filesystem integrity is regularly checked (Scored)
#
# Periodic checking of the filesystem integrity is needed to detect changes to the filesystem.
#
# Rationale:
# Periodic file checking allows the system administrator to determine on a regular basis if critical 
# files have been changed in an unauthorized fashion.
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
#   class security_baseline::rules::sec_aide_cron {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_aide_cron (
  Boolean $enforce = true, # TODO: Alignment
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    # Could all of this logic have been replaced by a cron resource?
    # https://forge.puppet.com/puppetlabs/cron_core
    if(empty($::aide_cron) and ! empty($::aide_version)) {

      file { '/etc/cron.d/aide.cron':
        ensure => file,
        source => 'puppet:///modules/security_baseline/aide-cron',
        owner  => 'root',
        group  => 'root',
        mode   => '0644';
      }

    }

  # If we aren't enforcing, why would we use a notify and not jusst use noop?
  } else {

    if(empty($::aide_cron)) {

      notify { 'aide-cron':
        message  => $message,
        loglevel => $loglevel,
      }
    }

  }
}
