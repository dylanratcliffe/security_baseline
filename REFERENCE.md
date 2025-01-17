# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

_Public Classes_

* [`security_baseline`](#security_baseline): Security baseline enforcement and monitoring

_Private Classes_

* `security_baseline::rules::sec_aide`: Ensure AIDE is installed (Scored)
* `security_baseline::rules::sec_aide_cron`: Ensure filesystem integrity is regularly checked (Scored)
* `security_baseline::rules::sec_automounting`: Disable Automounting (Scored)
* `security_baseline::rules::sec_avahi`: Ensure Avahi Server is not enabled (Scored)
* `security_baseline::rules::sec_core_dump`: Ensure core dumps are restricted (Scored)
* `security_baseline::rules::sec_cramfs`: Ensure mounting of cramfs filesystems is disabled (Scored)
* `security_baseline::rules::sec_cups`: Ensure CUPS is not enabled (Scored)
* `security_baseline::rules::sec_dev_shm_nodev`: Ensure nodev option set on /dev/shm partition (Scored)
* `security_baseline::rules::sec_dev_shm_noexec`: Ensure noexec option set on /dev/shm partition (Scored)
* `security_baseline::rules::sec_dev_shm_nosuid`: Ensure nosuid option set on /dev/shm partition (Scored)
* `security_baseline::rules::sec_dhcpd`: Ensure DHCP Server is not enabled (Scored)
* `security_baseline::rules::sec_dns`: Ensure DNS Server is not enabled (Scored)
* `security_baseline::rules::sec_dovecot`: Ensure IMAP and POP3 server is not enabled (Scored)
* `security_baseline::rules::sec_freevxfs`: Ensure mounting of freevxfs filesystems is disabled (Scored)
* `security_baseline::rules::sec_gdm`: 
* `security_baseline::rules::sec_grub2`: Ensure permissions on bootloader config are configured (Scored)
* `security_baseline::rules::sec_grub_passwd`: Ensure bootloader password is set (Scored)
* `security_baseline::rules::sec_hfs`: Ensure mounting of hfs filesystems is disabled (Scored)
* `security_baseline::rules::sec_hfsplus`: Ensure mounting of hfsplus filesystems is disabled (Scored)
* `security_baseline::rules::sec_home_nodev`: Ensure nodev option set on /home partition (Scored)
* `security_baseline::rules::sec_home_partition`: Ensure separate partition exists for /home (Scored)
* `security_baseline::rules::sec_hosts_allow`: Ensure /etc/hosts.allow is configured (Scored)
* `security_baseline::rules::sec_hosts_deny`: Ensure /etc/hosts.deny is configured (Scored)
* `security_baseline::rules::sec_httpd`: Ensure HTTP server is not enabled (Scored)
* `security_baseline::rules::sec_iptables`: Ensure iptables is installed (Scored)
* `security_baseline::rules::sec_issue`: Ensure local login warning banner is configured properly (Not Scored)
* `security_baseline::rules::sec_issue_net`: Ensure remote login warning banner is configured properly (Not Scored)
* `security_baseline::rules::sec_issue_net_permissions`: Ensure permissions on /etc/issue.net are configured (Not Scored)
* `security_baseline::rules::sec_issue_permissions`: Ensure permissions on /etc/issue are configured (Scored)
* `security_baseline::rules::sec_jffs2`: Ensure mounting of jffs2 filesystems is disabled (Scored)
* `security_baseline::rules::sec_kernel_aslr`: Ensure address space layout randomization (ASLR) is enabled (Scored)
* `security_baseline::rules::sec_ldap`: Ensure LDAP server is not enabled (Scored)
* `security_baseline::rules::sec_mcstrans`: Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
* `security_baseline::rules::sec_motd`: Ensure message of the day is configured properly (Scored)
* `security_baseline::rules::sec_motd_permissions`: A short summary of the purpose of this class
* `security_baseline::rules::sec_net_dccp`: Ensure DCCP is disabled (Not Scored)
* `security_baseline::rules::sec_net_rds`: Ensure RDS is disabled (Not Scored)
* `security_baseline::rules::sec_net_sctp`: Ensure SCTP is disabled (Not Scored)
* `security_baseline::rules::sec_net_tipc`: Ensure TIPC is disabled (Not Scored)
* `security_baseline::rules::sec_network_bogus_icmp_responses`: Ensure bogus ICMP responses are ignored (Scored)
* `security_baseline::rules::sec_network_broadcast_icmp_requests`: Ensure broadcast ICMP requests are ignored (Scored)
* `security_baseline::rules::sec_network_icmp_redirect`: Ensure ICMP redirects are not accepted (Scored)
* `security_baseline::rules::sec_network_ip_forward`: Ensure IP forwarding is disabled (Scored)
* `security_baseline::rules::sec_network_ipv6_disable`: Ensure IPv6 is disabled (Not Scored)
* `security_baseline::rules::sec_network_ipv6_redirects`: Ensure ICMP redirects are not accepted (Scored)
* `security_baseline::rules::sec_network_ipv6_router_advertisements`: Ensure IPv6 router advertisements are not accepted (Not Scored)
* `security_baseline::rules::sec_network_log_suspicious_packets`: Ensure secure ICMP redirects are not accepted (Scored)
* `security_baseline::rules::sec_network_packet_redirect`: Ensure packet redirect sending is disabled (Scored)
* `security_baseline::rules::sec_network_reverse_path_filtering`: Ensure Reverse Path Filtering is enabled (Scored)
* `security_baseline::rules::sec_network_secure_icmp_redirect`: Ensure secure ICMP redirects are not accepted (Scored)
* `security_baseline::rules::sec_network_source_route`: Ensure source routed packets are not accepted (Scored)
* `security_baseline::rules::sec_network_tcp_syn_cookies`: Ensure TCP SYN Cookies is enabled (Scored)
* `security_baseline::rules::sec_nfs_rpcbind`: Ensure NFS and RPC are not enabled (Scored)
* `security_baseline::rules::sec_nis`: Ensure NIS Server is not enabled (Scored)
* `security_baseline::rules::sec_nis_client`: Ensure NIS Client is not installed (Scored)
* `security_baseline::rules::sec_ntalk`: Ensure talk server is not enabled (Scored)
* `security_baseline::rules::sec_openldap_client`: Ensure LDAP client is not installed (Scored)
* `security_baseline::rules::sec_prelink`: Ensure prelink is disabled (Scored)
* `security_baseline::rules::sec_rhnsd`: Disable the rhnsd Daemon (Not Scored)
* `security_baseline::rules::sec_rsh`: Ensure rsh server is not enabled (Scored)
* `security_baseline::rules::sec_rsh_client`: Ensure rsh client is not installed (Scored)
* `security_baseline::rules::sec_rsyncd`: Ensure talk server is not enabled (Scored)
* `security_baseline::rules::sec_security_patches`: Ensure updates, patches, and additional security software are installed (Scored)
* `security_baseline::rules::sec_selinux`: Ensure SELinux is installed (Scored)
* `security_baseline::rules::sec_selinux_bootloader`: Ensure SELinux is not disabled in bootloader configuration (Scored)
* `security_baseline::rules::sec_selinux_policy`: 1.6.1.3
* `security_baseline::rules::sec_selinux_state`: Ensure the SELinux state is enforcing (Scored)
* `security_baseline::rules::sec_service_chargen`: Ensure chargen services are not enabled (Scored)
* `security_baseline::rules::sec_service_daytime`: Ensure daytime services are not enabled (Scored)
* `security_baseline::rules::sec_service_discard`: Ensure discard services are not enabled (Scored)
* `security_baseline::rules::sec_service_echo`: Ensure echo services are not enabled (Scored)
* `security_baseline::rules::sec_service_tftp`: Ensure tftp server is not enabled (Scored)
* `security_baseline::rules::sec_service_time`: Ensure time services are not enabled (Scored)
* `security_baseline::rules::sec_service_xinetd`: Ensure xinetd is not enabled (Scored)
* `security_baseline::rules::sec_setroubleshoot`: Ensure SETroubleshoot is not installed (Scored)
* `security_baseline::rules::sec_single_user_mode`: Ensure authentication required for single user mode (Scored)
* `security_baseline::rules::sec_smb`: Ensure DHCP Server is not enabled (Scored)
* `security_baseline::rules::sec_snmpd`: Ensure SNMP Server is not enabled (Scored)
* `security_baseline::rules::sec_squashfs`: Ensure mounting of squashfs filesystems is disabled (Scored)
* `security_baseline::rules::sec_squid`: Ensure HTTP Proxy Server is not enabled (Scored)
* `security_baseline::rules::sec_sticky_world_writeable`: Ensure sticky bit is set on all world-writable directories (Scored)
* `security_baseline::rules::sec_talk_client`: Ensure talk client is not installed (Scored)
* `security_baseline::rules::sec_tcp_wrappers`: Ensure TCP Wrappers is installed (Scored)
* `security_baseline::rules::sec_telnet`: Ensure telnet server is not enabled (Scored)
* `security_baseline::rules::sec_telnet_client`: Ensure telnet client is not installed (Scored)
* `security_baseline::rules::sec_tftp`: Ensure telnet server is not enabled (Scored)
* `security_baseline::rules::sec_tmp_nodev`: Ensure nodev option set on /tmp partition (Scored)
* `security_baseline::rules::sec_tmp_noexec`: Ensure noexec option set on /tmp partition (Scored)
* `security_baseline::rules::sec_tmp_nosuid`: Ensure nosuid option set on /tmp partition (Scored)
* `security_baseline::rules::sec_tmp_partition`: Ensure separate partition exists for /tmp (Scored)
* `security_baseline::rules::sec_udf`: Ensure mounting of udf filesystems is disabled (Scored)
* `security_baseline::rules::sec_unconfigured_daemons`: Ensure no unconfined daemons exist (Scored)
* `security_baseline::rules::sec_var_log_audit_partition`: Ensure separate partition exists for /var/log/audit (Scored)
* `security_baseline::rules::sec_var_log_partition`: Ensure separate partition exists for /var/log (Scored)
* `security_baseline::rules::sec_var_partition`: Ensure separate partition exists for /var (Scored)
* `security_baseline::rules::sec_var_tmp_nodev`: Ensure nodev option set on /var/tmp partition (Scored)
* `security_baseline::rules::sec_var_tmp_noexec`: Ensure noexec option set on /var/tmp partition (Scored)
* `security_baseline::rules::sec_var_tmp_nosuid`: Ensure nosuid option set on /var/tmp partition (Scored)
* `security_baseline::rules::sec_var_tmp_partition`: Ensure separate partition exists for /var/tmp (Scored)
* `security_baseline::rules::sec_vfat`: Ensure mounting of FAT filesystems is disabled (Scored)
* `security_baseline::rules::sec_vsftpd`: Ensure FTP Server is not enabled (Scored)
* `security_baseline::rules::sec_x11_installed`: Ensure X Window System is not installed (Scored)
* `security_baseline::rules::sec_yum_gpgcheck`: Ensure gpgcheck is globally activated (Scored)

**Defined types**

* [`security_baseline::sec_check`](#security_baselinesec_check): Check a security rule.

## Classes

### security_baseline

Define a complete security baseline and monitor the rules. The definition of the baseline can be done in Hiera.
The purpose of the module is to give the ability to setup complete security baseline which not necessarily have to stick
to an industry security guide like the CIS benchmarks.
One main purpose is to ensure the module can be extended by further security settings and monitorings without changing the code of
this module.

The easiest way to use the module is to put all rule data into a hiera file. For more information please coinsult the README file.

#### Examples

##### 

```puppet
include security_baseline
```

#### Parameters

The following parameters are available in the `security_baseline` class.

##### `baseline_version`

Data type: `String`

Version of the security ruleset

##### `rules`

Data type: `Hash`

Hash containing the wholw ruleset

##### `debug`

Data type: `Boolean`

Switch debug output on

Default value: `false`

##### `log_info`

Data type: `Boolean`

Switch logging with level info on

Default value: `false`

## Defined types

### security_baseline::sec_check

Check a security rule, enforce it or just monitor it and log into the Puppet log files.

#### Examples

##### 

```puppet
security_baseline::sec_check { '1.1.2':
    rulename => 'tmp_partition',
    active => true,
    description => 'The /tmp directory ...',
    enforce => true,
    class => '::security_baseline::rules::sec_tmp_partition',
    check => {
      fact_name => 'tmp_partition',
      fact_value => '/tmp',
    },
    message => 'Not in compliance with rule 1.1.2. No seperate directory for /tmp.',
    loglevel => 'warning',
}
```

#### Parameters

The following parameters are available in the `security_baseline::sec_check` defined type.

##### `rulename`

Data type: `String`

Name of the rule for loggting

##### `active`

Data type: `Boolean`

Sets a rule active or inactive. Inactive rules will not be used

Default value: `true`

##### `description`

Data type: `String`

Information about the rule. Currently only for information.

##### `enforce`

Data type: `Boolean`

Sets rule enforcemt. If set to true, code will be exeuted to bring the system into a comliant state.

##### `class`

Data type: `String`

Class implementing the rule. This might be a class with this module but can reference an external class as well.
This makes this module highly generic.

##### `check`

Data type: `Hash`

A hash describing the fact for the test and the desired value

##### `message`

Data type: `String`

Message to print into the log

Default value: ''

##### `loglevel`

Data type: `String`

Loglevel for the message

Default value: 'warning'

##### `config_data`

Data type: `Optional[Hash]`

Additional configuration data, especially if external security modules are used to provide configuration data
to those modules

Default value: {}

