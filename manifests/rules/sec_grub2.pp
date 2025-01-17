# @summary 
#    Ensure permissions on bootloader config are configured (Scored)
#
# The grub configuration file contains information on boot settings and passwords for unlocking boot 
# options. The grub configuration is usually located at /boot/grub2/grub.cfg and linked as /etc/grub2.cfg. 
# Additional settings can be found in the /boot/grub2/user.cfg file.
#
# Rationale:
# Setting the permissions to read and write for root only prevents non-root users from seeing the boot 
# parameters or changing them. Non-root users who read the boot parameters may be able to identify 
# weaknesses in security upon boot and be able to exploit them.
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
#   class security_baseline::rules::sec_grub2 {
#       enforce => true,
#       message => 'Test',
#       loglevel => 'info'
#   }
#
# @api private
class security_baseline::rules::sec_grub2 (
  Boolean $enforce = true,
  String $message = '',
  String $loglevel = ''
) {

  if($enforce) {

    file { '/boot/grub2/grub.cfg':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

    file { '/boot/grub2/user.cfg':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

  }
}
