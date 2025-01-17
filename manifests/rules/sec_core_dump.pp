# @summary 
#    Ensure core dumps are restricted (Scored)
#
# A core dump is the memory of an executable program. It is generally used to determine why a 
# program aborted. It can also be used to glean confidential information from a core file. The 
# system provides the ability to set a soft limit for core dumps, but this can be overridden 
# by the user.
#
# Rationale:
# Setting a hard limit on core dumps prevents users from overriding the soft variable. If core dumps 
# are required, consider setting limits for user groups (see limits.conf(5) ). In addition, setting 
# the fs.suid_dumpable variable to 0 will prevent setuid programs from dumping core.
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
#   class security_baseline::rules::sec_core_dump {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_core_dump (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    file_line { 'limits_hc':
      path => '/etc/security/limits.conf',
      line => '* hard core 0',
    }

    sysctl { 'fs.suid_dumpable':
      value => 0,
    }

  }
}
