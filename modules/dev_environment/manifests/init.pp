class dev_environment {
  user { 'rudra.magar':
    ensure      => present,
    managehome => true,
    groups       => ['wheel'],
  }

  package { 'vim':
    ensure      => present,
  }

  file { '/home/rudra.magar/.vimrc':
    ensure      => file,
    content     => template('dev_environment/vimrc.erb'),
    owner       => 'rudra.magar',
    mode        => '0644',
  }

  file { '/usr/local/bin/puppetd':
    ensure      => file,
    content     => template('dev_environment/puppetd.sh.erb'),
    mode        => '0755',
  }
}
