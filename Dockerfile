FROM fedora:27

RUN dnf update -y ; \
    dnf install openssh* wget bzip2 unzip gzip git sudo hostname procps gcc-c++ -y ; \
    dnf upgrade glibc -y; \
    dnf clean all

# SSH service start
RUN ssh-keygen -A ; \
    mkdir -p /var/run/sshd ; \
    echo 'root:youjumpijump' | chpasswd ; \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# SSH service end

ADD scripts/ /scripts
ADD notebooks/ /work
RUN /scripts/env.init.sh

EXPOSE 8888
CMD ["/scripts/start-jupyter.sh"]


