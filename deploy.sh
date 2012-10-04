#!/bin/sh -x
# 
# missing: header, license, usage

PUPPET_ENV='--confdir=puppet'

install_prerequisites () {
  apt-get update
  apt-get install puppet git

  # lsb is needed for a first puppet run
  puppet apply $PUPPET_ENV --execute 'include lsb'
  git submodule init
  git submodule update
}

# main 

# commented for testing purposes
#install_prerequisites

puppet apply $PUPPET_ENV puppet/manifests/site.pp $@

