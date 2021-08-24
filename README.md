ansible-role-nrpe-plugins
=========

[![Build Status](https://travis-ci.org/CSCfi/ansible-role-nrpe-plugins.svg?branch=master)](https://travis-ci.org/CSCfi/ansible-role-nrpe-plugins)

This is not a place where to store nagios checks. It can:

 - get_url of a remote file (and verify checksums)
 - copy a local file to destination, perhaps available in files/ directory
 - set SELinux file contexts for checks if needed

Configuring nrpe, restarting nrpe is not part of this role.

Requirements
------------

a list of checks


Role Variables
--------------

Example:
<pre>
nrpe_check_location: "/usr/local/nagios/libexec"
nrpe_remote_url_checks:
 - { url: "http://url1/check_elasticsearch", name: "check_elasticsearch", checksum: "7e39171be1095b3c6a35c9649e3d5e73bcf76a3647b99fd7a205248a35d6a6f9" }
nrpe_local_checks:
 - { path: "files/check_custom2", name: "check_custom2" }
nrpe_check_selinux_contexts:
 - { target: "files/check_custom2", setype: "nagios_unconfined_plugin_exec_t", state: "present" }
nrpe_pip_checks:
 - nagiosplugin
</pre>

Dependencies
------------

https://github.com/CSCfi/ansible-role-nrpe

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ansible-role-nrpe }
         - { role: ansible-role-nrpe-plugins }

License
-------

MIT

Author Information
------------------
