ansible-role-nrpe-plugins
=========

[![Build Status](https://travis-ci.org/CSC-IT-Center-for-Science/ansible-role-nrpe.svg?branch=master)](https://travis-ci.org/CSC-IT-Center-for-Science/ansible-role-nrpe)

This is not a place where to store nagios checks. It can:

 - get_url of a remote file (and check checksum)
 - copy of a local file, perhaps available in files/

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
</pre>

Dependencies
------------

https://github.com/CSC-IT-Center-for-Science/ansible-role-nrpe

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
