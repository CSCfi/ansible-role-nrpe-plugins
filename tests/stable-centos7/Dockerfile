# Latest version of centos
FROM centos:centos7
MAINTAINER James Cuzella <james.cuzella@lyraphase.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y groupinstall "Development tools" && \
    yum -y install python-devel MySQL-python sshpass && \
    yum -y install acl sudo && \
    sed -i -e 's/^Defaults.*requiretty/Defaults    !requiretty/' -e 's/^%wheel.*ALL$/%wheel    ALL=(ALL)    NOPASSWD: ALL/' /etc/sudoers && \
    yum -y install python-setuptools python-pip && \
    pip install setuptools==42.0.2 pathlib && \
    pip install wheel &&\
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko git  && \
    pip install requests[security] && \
    pip install pbr==1.1.0 debtcollector==0.5.0 stevedore==1.5.0 && \
    pip install pysphere boto boto3 passlib dnspython && \
    yum -y remove $(rpm -qa "*-devel") && \
    yum -y groupremove "Development tools" && \
    yum -y autoremove && \
    yum -y install bzip2 crontabs file findutils gem git gzip hg procps-ng svn sudo tar tree which unzip xz zip

RUN mkdir /etc/ansible/
RUN echo -e '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN mkdir /opt/ansible/
RUN git clone http://github.com/ansible/ansible.git /opt/ansible/ansible
WORKDIR /opt/ansible/ansible
# because at a later commit we hit https://github.com/ansible/ansible/issues/17534
RUN git checkout f4af154beff2b281e464b616f504293d67187da5
RUN git submodule update --init
ENV PATH /opt/ansible/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library
# Workaround bug in pip / pylockfile: http://pad.lv/1472101
# If HOME is a volume mount, causes infinite loop in pip trying to write lock
ENV XDG_CACHE_HOME /tmp/
RUN source /opt/ansible/ansible/hacking/env-setup


CMD /bin/bash
