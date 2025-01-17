# @summary Ensure SELinux is not disabled in bootloader configuration (Scored)
#
# Configure SELINUX to be enabled at boot time and verify that it has not been overwritten by the grub boot parameters.
#
# Rationale:
# SELinux must be enabled at boot time in your grub configuration to ensure that the controls it provides are not overridden.
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
#   class ecurity_baseline::rules::sec_selinux_bootloader {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_selinux_bootloader (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {
  if($enforce) {

    file_line { 'cmdline_definition':
      line  => 'GRUB_CMDLINE_LINUX_DEFAULT="quiet"',
      path  => '/etc/default/grub',
      match => '^GRUB_CMDLINE_LINUX_DEFAULT',
    }

  } else {

    if($::bootloader_selinux == false) {

      notify { 'bootloader-selinux':
        message  => $message,
        loglevel => $loglevel,
      }

    }
  }
}
