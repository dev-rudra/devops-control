node default {
  file { '/usr/local/bin/puppetd':
    ensure => file,
    source => 'puppet:///files/puppetd',
    mode   => '0755',
  }
}
