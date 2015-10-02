===================================================
Hathisar -- The Hadoop intergration testing framework
===================================================

``hathisar`` is an automation framework for Hadoop, written in Bash and Python. It contains scripts for deploying object stores (e.g., Swift), connecting them to Hadoop, running Hadoop jobs, and graphing results. It is based on Ceph's `teuthology <https://github.com/ceph/teuthology>`__ test framework. 

`Hathisars <http://www.asesg.org/PDFfiles/Gajah/23-01-Glossary.pdf>`__ are elephant stables managed by mahout families in Nepal.

Directory Structure
========

- ``deploy``: this folder has the Ansible scripts for deploying the systems and running experiments.

- ``install``: this folder has the Docker image scripts for installing the systems. Stuff in here gets built into an image and automatically uploaded to the Docker Hub.

Setup
========

1. On all nodes, install Docker using their directions `here<https://docs.docker.com/installation/>`__
#. ... 

