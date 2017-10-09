#!/bin/bash
# This is just an example check so that we can test this role a bit more.

used_space=`df -h / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g'`
case $used_space in
[1-84]*)
echo "OK - $used_space% of disk space used."
exit 0
;;
[85]*)
echo "WARNING - $used_space% of disk space used."
exit 1
;;
[86-100]*)
echo "CRITICAL - $used_space% of disk space used."
exit 2
;;
*)
echo "UNKNOWN - $used_space% of disk space used."
exit 3
;;
esac
