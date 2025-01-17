# @summary 
#    Ensure SETroubleshoot is not installed (Scored)
#
# The SETroubleshoot service notifies desktop users of SELinux denials through a user- friendly interface. 
# The service provides important information around configuration errors, unauthorized intrusions, and other 
# potential errors.
#
# Rationale:
# The SETroubleshoot service is an unnecessary daemon to have running on a server, especially if X Windows is disabled.
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
#   class security_baseline::rules::sec_setroubleshoot {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_setroubleshoot (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {

  if($enforce) {

    package { 'setroubleshoot':
      ensure => purged,
    }

  } else {

    if($::setroubleshoot_pkg) {

      notify { 'setroubleshoot':
        message  => $message,
        loglevel => $loglevel,
      }

    }
  }
}
