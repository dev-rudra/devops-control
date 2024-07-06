node default {
  file { '/usr/local/bin/puppetd.sh':
    ensure => file,
    mode   => '0755',
  }
}
