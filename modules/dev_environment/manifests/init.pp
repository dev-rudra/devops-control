class dev_environment {
  file { '/usr/local/bin/puppetd':
    ensure  => file,
    content => template('dev_environment/puppetd.sh.erb'),
    mode    => '0755',
  }
}
