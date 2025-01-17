# @summary 
#    Ensure remote login warning banner is configured properly (Not Scored)
#
# The contents of the /etc/issue.net file are displayed to users prior to login for remote connections 
# from configured services.
# Unix-based systems have typically displayed information about the OS release and patch level upon logging 
# in to the system. This information can be useful to developers who are developing software for a particular 
# OS platform. If mingetty(8) supports the following options, they display operating system information: 
# \m - machine architecture \r - operating system release \s - operating system name \v - operating system version
#
# Rationale:
# Warning messages inform users who are attempting to login to the system of their legal status regarding the 
# system and must include the name of the organization that owns the system and any monitoring policies that 
# are in place. Displaying OS and patch level information in login banners also has the side effect of providing 
# detailed system information to attackers attempting to target specific exploits of a system. Authorized users 
# can easily get this information by running the " uname -a " command once they have logged in.
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
#   class security_baseline::rules::sec_issue_net {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_issue_net (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    if($::issue_net) {
      notify { 'issue-net':
        message  => $message,
        loglevel => $loglevel,
      }
    }
  }
}
