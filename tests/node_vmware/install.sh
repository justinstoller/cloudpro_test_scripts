#!/bin/sh
 
if [ "$#" -ne 2 ]; then
  echo "usage: `basename $0` address certname"
  exit 1
fi
 
BASE=`dirname $0`
INSTALLER="${HOME}/puppet-enterprise-3.0.1-rc0-39-g786d58e-ubuntu-12.04-amd64.tar.gz"
ANSWERS=`mktemp`
PRIVKEY="${HOME}/.ssh/id_rsa"
PUBKEY="${HOME}/.ssh/id_rsa.pub"
 
ssh "$1" "cat >> ~/.ssh/authorized_keys" < "$PUBKEY"
 
cat > "$ANSWERS" <<EOT
q_all_in_one_install=n
q_database_install=n
q_fail_on_unsuccessful_master_lookup=n
q_install=y
q_pe_database=n
q_puppet_cloud_install=n
q_puppet_enterpriseconsole_install=n
q_puppet_symlinks_install=y
q_puppetagent_certname=domtest1204
q_puppetagent_install=y
q_puppetagent_server=puppet
q_puppetca_install=n
q_puppetdb_install=n
q_puppetmaster_install=n
q_run_updtvpkg=n
q_vendor_packages_install=y
EOT

 
set -x
 
puppet node install \
  --login root \
  --keyfile "$PRIVKEY" \
  --install-script puppet-enterprise \
  --installer-payload "$INSTALLER" \
  --installer-answers "$ANSWERS" \
  --debug \
  "$1"
