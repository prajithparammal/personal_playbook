FROM alpine:latest

ENV http_proxy=http://web-proxy.sgp.hp.com:8080
ENV https_proxy=http://web-proxy.sgp.hp.com:8080

ENV ANSIBLE_LIBRARY=/oneview-ansible/library
ENV ANSIBLE_MODULE_UTILS=/oneview-ansible/library/module_utils/

RUN apk update \
  && apk add --no-cache ansible git py-pip openssh-client bash vim \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*

RUN git clone https://github.com/HewlettPackard/oneview-ansible.git
RUN git clone https://github.com/HewlettPackard/python-hpOneView.git \
  && pip install ./python-hpOneView

RUN mkdir /etc/ansible \
  && echo localhost ansible_python_interpreter=python2 ansible_connection=local > /etc/ansible/hosts
